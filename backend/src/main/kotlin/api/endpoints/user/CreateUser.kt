package src.api.endpoints.user

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import src.api.endpoints.Endpoint
import src.api.responses.ErrorResponse
import src.api.responses.PublicUserResponse
import src.api.responses.Response
import src.data.UserData
import src.database.PublicDb

@Serializable
class CreateUserArgs(private val username: String){

    fun toUserData() = UserData(username)
}

class CreateUser(private val publicDb: PublicDb) : Endpoint{

    override val path = "/createUser"

    override fun handle(jsonInput: String): Response {
        val args = json.decodeFromString<CreateUserArgs>(jsonInput)

        val user = publicDb.createUser(args.toUserData())
            ?: return ErrorResponse("There was a problem creating the user")

        return PublicUserResponse.from(user)
    }
}