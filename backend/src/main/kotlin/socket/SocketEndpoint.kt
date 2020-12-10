package src.socket

import io.ktor.http.cio.websocket.*
import io.ktor.websocket.*

interface SocketEndpoint<T : SocketClient> {

    val path: String

    fun createClient(socket: DefaultWebSocketServerSession): T

    suspend fun onConnect(client: T)
    suspend fun onClose(client: T)

    suspend fun onMessage(client: T, frame: Frame)
}

