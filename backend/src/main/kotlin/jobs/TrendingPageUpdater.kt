package src.jobs

import kotlinx.coroutines.runBlocking
import src.database.PublicDb
import src.database.dbitems.Post
import src.socket.trending.TrendingPageEndpoint

class TrendingPageUpdater(private val publicDb: PublicDb,
                          private val trendingPageEndpoint: TrendingPageEndpoint) {

    private var nextUpdate: Long = System.currentTimeMillis()
    private var latestPosts: List<Post> = listOf()

    private val postUpdateTime = 2 * 60 * 1000
    private val shouldUpdate get() = System.currentTimeMillis() > nextUpdate

    fun start(){
        Thread {
            while(true){
                if(shouldUpdate){
                    updatePosts()
                }
                sendPost()
                Thread.sleep(2000)
            }
        }.start()
    }

    private fun updatePosts(){
        if(!trendingPageEndpoint.hasClients){
            return
        }
        println("Updating Post List for Trending Page")
        nextUpdate = System.currentTimeMillis() + postUpdateTime
        latestPosts = publicDb.posts.getLatestPosts(50)
    }

    private fun sendPost(){
        latestPosts.randomOrNull()?.let {
            runBlocking {
                trendingPageEndpoint.sendPost(it)
            }
        }
    }
}