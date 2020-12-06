package src.api.responses

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.data.Id
import src.database.dbitems.User

@Serializable
class PublicUserResponse(val userId: Id,
                         val username: String){

    companion object{
        fun from(user: User) = PublicUserResponse(user.id, user.data.username)
    }

    fun toJson() = Json.encodeToString(this)
}