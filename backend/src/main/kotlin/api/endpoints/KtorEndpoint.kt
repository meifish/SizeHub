package src.api.endpoints

import io.ktor.application.*
import io.ktor.http.*
import io.ktor.request.*
import io.ktor.response.*
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

class KtorGetHandler {

    suspend fun handle(call: ApplicationCall, endpoint: Endpoint){
        println("Get request to ${endpoint.path}")
        try{
            val argMap = call.request.queryParameters.entries().map { it.key to it.value.first() }.toMap()
            val response = endpoint.handle(Json.encodeToString(argMap))
            call.respond(response)
        }
        catch (e: Exception){
            call.respond(HttpStatusCode.InternalServerError, e.localizedMessage)
        }
    }
}

class KtorPostHandler {

    suspend fun handle(call: ApplicationCall, endpoint: Endpoint){
        println("Post request to ${endpoint.path}")
        try{
            call.respond(endpoint.handle(call.receiveText()))
        }
        catch (e: Exception){
            e.printStackTrace()
            call.respond(HttpStatusCode.InternalServerError, e.localizedMessage)
        }
    }
}