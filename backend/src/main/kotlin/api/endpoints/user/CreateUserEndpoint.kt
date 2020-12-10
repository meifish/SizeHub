package src.api.endpoints.user

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.Endpoint
import src.api.responses.ErrorResponse
import src.api.responses.UserPublicResponse
import src.data.UserData
import src.database.PublicDb

@Serializable
class CreateUserArgs(private val email: String, private val username: String){

    fun toUserData() = UserData(email, username)
}

class CreateUserEndpoint(private val publicDb: PublicDb) : Endpoint{

    override val path get() = "/createUser"

    override fun handle(jsonInput: String): String {
        val args = json.decodeFromString<CreateUserArgs>(jsonInput)

        val user = publicDb.createUser(args.toUserData())
            ?: return ErrorResponse("There was a problem creating the user").toJson()

        return UserPublicResponse.from(user.toPublicUser()).toJson()
    }
}