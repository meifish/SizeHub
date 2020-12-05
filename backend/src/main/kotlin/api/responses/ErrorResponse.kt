package src.api.responses

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

@Serializable
class ErrorResponse(val error: String) : Response{

    companion object{
        fun unknown() = ErrorResponse("Something went wrong")
        fun notFound(name: String) = ErrorResponse("No $name found with the given Id")
        fun postNotFound() = notFound("Post")
    }
}