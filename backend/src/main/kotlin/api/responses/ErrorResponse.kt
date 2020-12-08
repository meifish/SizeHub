package src.api.responses

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

@Serializable
class ErrorResponse(val error: String) {

    companion object{
        fun unknown() = ErrorResponse("Something went wrong")
        fun notFound(name: String) = ErrorResponse("No $name found with the given Id")
        fun postNotFound() = notFound("Post")
        fun invalidToken() = ErrorResponse("Token is not valid")
    }

    fun toJson() = Json.encodeToString(this)
}