package src.socket

import io.ktor.http.cio.websocket.*
import io.ktor.websocket.*

interface SocketClient {

    suspend fun send(message: String)
}

class SocketClientImpl(private val socket: DefaultWebSocketServerSession) : SocketClient {

    override suspend fun send(message: String) {
        socket.send(Frame.Text(message))
    }
}