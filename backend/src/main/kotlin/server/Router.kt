package src.server

import io.ktor.routing.*
import src.api.endpoints.Endpoint
import src.api.endpoints.KtorGetHandler
import src.api.endpoints.KtorPostHandler
import src.api.endpoints.comment.CreateCommentEndpoint
import src.api.endpoints.comment.GetRepliesEndpoint
import src.api.endpoints.post.CreatePostEndpoint
import src.api.endpoints.post.GetDetailedPostEndpoint
import src.api.endpoints.user.CreateUserEndpoint
import src.api.endpoints.user.GetDetailedProfileEndpoint
import src.database.PublicDb

class Router(publicDb: PublicDb) {

    private val ktorGetHandler = KtorGetHandler()
    private val ktorPostHandler = KtorPostHandler()

    private val getEndpoints: List<Endpoint> = listOf(
        //comment
        GetRepliesEndpoint(publicDb),

        //post
        GetDetailedPostEndpoint(publicDb),

        //user
        GetDetailedProfileEndpoint(publicDb)
    )

    private val postEndpoints: List<Endpoint> = listOf(
        //comment
        CreateCommentEndpoint(publicDb),

        //post
        CreatePostEndpoint(publicDb),

        //user
        CreateUserEndpoint(publicDb)
    )

    val setup: Routing.() -> Unit = {
        getEndpoints.forEach { endpoint ->
            get(endpoint.path) { ktorGetHandler.handle(context, endpoint) }
        }
        postEndpoints.forEach { endpoint ->
            post(endpoint.path) { ktorPostHandler.handle(context, endpoint) }
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
    }
}