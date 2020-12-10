package src.socket.trending

import io.ktor.http.cio.websocket.*
import io.ktor.websocket.*
import src.api.responses.PostPreviewResponse
import src.database.dbitems.Post
import src.socket.SocketEndpoint
import java.util.*
import kotlin.collections.LinkedHashSet

class TrendingPageEndpoint : SocketEndpoint<TrendingPageClient> {

    override val path: String get() = "/trending"

    private val clients = Collections.synchronizedSet(LinkedHashSet<TrendingPageClient>())
    val hasClients get() = clients.isNotEmpty()

    suspend fun sendPost(post: Post){
        clients.forEach {
            it.send(PostPreviewResponse.from(post).toJson())
        }
    }

    override fun createClient(socket: DefaultWebSocketServerSession) = TrendingPageClient(socket)

    override suspend fun onConnect(client: TrendingPageClient) {
        clients.add(client)
    }

    override suspend fun onClose(client: TrendingPageClient) {
        clients.remove(client)
    }

    override suspend fun onMessage(client: TrendingPageClient, frame: Frame) {}
}