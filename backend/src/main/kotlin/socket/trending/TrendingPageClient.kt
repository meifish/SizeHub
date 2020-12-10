package src.socket.trending

import io.ktor.websocket.*
import src.socket.SocketClient
import src.socket.SocketClientImpl

class TrendingPageClient(private val socket: DefaultWebSocketServerSession)
    : SocketClient by SocketClientImpl(socket)