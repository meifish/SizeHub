package src.api.responses

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

@Serializable
class ErrorResponse(val error: String){
    companion object{
        fun unknown() = ErrorResponse("Something went wrong")
    }

    fun toJson(json: Json) = json.encodeToString(this)
}