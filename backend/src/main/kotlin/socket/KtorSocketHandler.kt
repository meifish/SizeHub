package src.socket

import io.ktor.websocket.DefaultWebSocketServerSession
import kotlinx.coroutines.channels.ClosedReceiveChannelException

class KtorSocketHandler {

    companion object {

        suspend fun <T : SocketClient> handle(
            socketEndpoint: SocketEndpoint<T>,
            defaultWebSocketServerSession: DefaultWebSocketServerSession
        ) {
            val client = socketEndpoint.createClient(defaultWebSocketServerSession)
            socketEndpoint.onConnect(client)
            try {
                while (true) {
                    val frame = defaultWebSocketServerSession.incoming.receive()
                    socketEndpoint.onMessage(client, frame)
                }
            } catch (e: ClosedReceiveChannelException) {
            } finally {
                socketEndpoint.onClose(client)
            }
        }
    }
}