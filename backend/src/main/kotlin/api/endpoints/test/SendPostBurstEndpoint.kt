package src.api.endpoints.test

import kotlinx.coroutines.runBlocking
import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.Endpoint
import src.data.Id
import src.database.PublicDb
import src.socket.trending.TrendingPageEndpoint
import java.lang.Exception

@Serializable
class SendPostBurstArg(val postId: Id? = null,
                       val userId: Id? = null)

class SendPostBurstEndpoint(private val publicDb: PublicDb,
                            private val trendingPageEndpoint: TrendingPageEndpoint) : Endpoint {

    override val path get() = "/test/burst"

    override fun handle(jsonInput: String): String {
        val input: SendPostBurstArg = try{
            json.decodeFromString(jsonInput)
        } catch (e: Exception){
            SendPostBurstArg()
        }

        if(input.postId != null){
            publicDb.posts.getById(input.postId)?.let {
                runBlocking { trendingPageEndpoint.sendPost(it) }
            }
            return "Sent burst with postId ${input.postId}"
        }

        if(input.userId != null){
            publicDb.posts.getByUser(input.userId).forEach {
                runBlocking { trendingPageEndpoint.sendPost(it) }
            }
            return "Sent burst of posts from userId ${input.userId}"
        }

        val defaultUserId = "WWbTekDFTGDNaK5NDcEJ"
        publicDb.posts.getByUser(defaultUserId).forEach {
            runBlocking { trendingPageEndpoint.sendPost(it) }
        }

        return "Sent burst of posts from userId $defaultUserId"
    }
}