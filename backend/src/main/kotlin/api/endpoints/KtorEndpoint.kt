package src.api.endpoints

import io.ktor.application.*
import io.ktor.http.*
import io.ktor.request.*
import io.ktor.response.*
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

interface KtorEndpoint{

    suspend fun handle(call: ApplicationCall)
}

class KtorGetEndpoint(private val endpoint: Endpoint) {

    suspend fun handle(call: ApplicationCall){
        try{
            val argMap = call.request.queryParameters.entries().map { it.key to it.value.first() }.toMap()
            call.respond(endpoint.handle(Json.encodeToString(argMap)))
        }
        catch (e: Exception){
            call.respond(HttpStatusCode.InternalServerError, e.localizedMessage)
        }
    }
}

class KtorPostEndpoint(private val endpoint: Endpoint){

    suspend fun handle(call: ApplicationCall){
        try{
            call.respond(endpoint.handle(call.receiveText()))
        }
        catch (e: Exception){
            e.printStackTrace()
            call.respond(HttpStatusCode.InternalServerError, e.localizedMessage)
        }
    }
}