package src.api.responses

import kotlinx.serialization.Serializable

@Serializable
class ErrorResponse(val error: String){
    companion object{
        fun unknown() = ErrorResponse("Something went wrong")
    }
}