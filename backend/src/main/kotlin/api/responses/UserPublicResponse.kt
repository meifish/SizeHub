package src.api.responses

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.data.Id
import src.data.UserPublicData
import src.database.dbitems.PublicUser
import src.database.dbitems.User

@Serializable
class UserPublicResponse(val userId: Id,
                         val username: String){

    companion object{
        fun from(user: PublicUser) = UserPublicResponse(user.id, user.data.username)
    }

    fun toJson() = Json.encodeToString(this)
}