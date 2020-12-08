package src.data

import kotlinx.serialization.Serializable

@Serializable
class UserData(val email: String,
               val username: String){

    fun toPublicUserData() = UserPublicData(username)
}