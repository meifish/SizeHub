package src

import kotlinx.coroutines.runBlocking
import src.api.endpoints.user.CreateUserArgs
import src.data.UserData
import src.database.Database
import src.jobs.TrendingPageUpdater
import src.server.Router
import src.server.Server

fun main() {
    val database = Database()
    val router = Router(database.publicDb)
    val server = Server(router)

    database.publicDb.createPost.onPostCreate = {
        runBlocking {
            router.trendingPageHandler.sendPost(it)
        }
    }
    TrendingPageUpdater(database.publicDb, router.trendingPageHandler).start()
}