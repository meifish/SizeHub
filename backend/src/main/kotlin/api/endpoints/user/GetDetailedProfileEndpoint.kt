package src.api.endpoints.user

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.Endpoint
import src.api.responses.ErrorResponse
import src.api.responses.ProfileResponse
import src.data.Id
import src.data.PostData
import src.database.PublicDb

@Serializable
class GetDetailedProfileArgs(val userId: Id)

class GetDetailedProfileEndpoint(private val publicDb: PublicDb) : Endpoint{

    override val path get() = "/profile"

    override fun handle(jsonInput: String): String {
        val args = json.decodeFromString<GetDetailedProfileArgs>(jsonInput)

        val user = publicDb.users.getPublicDataById(args.userId)
            ?: return ErrorResponse.notFound("User").toJson()

        return ProfileResponse.from(user).toJson()
    }
}