package src.api.responses

import kotlinx.serialization.Serializable
import src.data.Id
import src.database.dbitems.User

@Serializable
class PublicUserResponse(val userId: Id,
                         val username: String) : Response{

    companion object{
        fun from(user: User) = PublicUserResponse(user.id, user.data.username)
    }
}