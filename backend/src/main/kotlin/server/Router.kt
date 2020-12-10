package src.server

import io.ktor.routing.*
import io.ktor.websocket.*
import src.api.endpoints.Endpoint
import src.api.endpoints.KtorGetHandler
import src.api.endpoints.KtorPostHandler
import src.api.endpoints.comment.CreateCommentEndpoint
import src.api.endpoints.comment.GetRepliesEndpoint
import src.api.endpoints.post.CreatePostEndpoint
import src.api.endpoints.post.GetDetailedPostEndpoint
import src.api.endpoints.test.SendPostBurstEndpoint
import src.api.endpoints.user.CreateUserEndpoint
import src.api.endpoints.user.GetDetailedProfileEndpoint
import src.api.endpoints.user.GetPostsByUserEndpoint
import src.database.PublicDb
import src.socket.KtorSocketHandler
import src.socket.SocketEndpoint
import src.socket.trending.TrendingPageEndpoint

class Router(publicDb: PublicDb) {

    val trendingPageHandler = TrendingPageEndpoint()

    private val getEndpoints: List<Endpoint> = listOf(
        //comment
        GetRepliesEndpoint(publicDb),

        //post
        GetDetailedPostEndpoint(publicDb),

        //user
        GetDetailedProfileEndpoint(publicDb),
        GetPostsByUserEndpoint(publicDb)
    )

    private val postEndpoints: List<Endpoint> = listOf(
        //comment
        CreateCommentEndpoint(publicDb),

        //post
        CreatePostEndpoint(publicDb),

        //user
        CreateUserEndpoint(publicDb),

        //test
        SendPostBurstEndpoint(publicDb, trendingPageHandler)
    )

    private val socketEndpoints: List<SocketEndpoint<*>> = listOf(
        trendingPageHandler
    )

    val setup: Routing.() -> Unit = {
        getEndpoints.forEach { endpoint ->
            get(endpoint.path) { KtorGetHandler.handle(context, endpoint) }
        }
        postEndpoints.forEach { endpoint ->
            post(endpoint.path) { KtorPostHandler.handle(context, endpoint) }
        }
        socketEndpoints.forEach { endpoint ->
            webSocket(endpoint.path){ KtorSocketHandler.handle(endpoint, this) }
        }
    }

    fun print(){
        println("/GET")
        getEndpoints.forEach {
            println("${it.path} - ${it.javaClass.simpleName.substring(0 until it.javaClass.simpleName.length-8)}")
        }
        println()
        println("/POST")
        postEndpoints.forEach {
            println("${it.path} - ${it.javaClass.simpleName.substring(0 until it.javaClass.simpleName.length-8)}")
        }
        println()
        println("/SOCKET")
        socketEndpoints.forEach {
            println("${it.path} - ${it.javaClass.simpleName.substring(0 until it.javaClass.simpleName.length-8)}")
        }
    }
}