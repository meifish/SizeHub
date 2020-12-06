package src.api.endpoints.user

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.Endpoint
import src.api.responses.ErrorResponse
import src.api.responses.PublicUserProfileResponse
import src.data.Id
import src.data.PostData
import src.database.PublicDb

@Serializable
class GetDetailedProfileArgs(val userId: Id)

@Serializable
class GetDetailedProfileResponse(val posts: List<PostData>)

class GetDetailedProfileEndpoint(private val publicDb: PublicDb) : Endpoint{

    override val path = "/profile"

    override fun handle(jsonInput: String): String {
        val args = json.decodeFromString<GetDetailedProfileArgs>(jsonInput)

        val user = publicDb.getPublicUser(args.userId)
            ?: return ErrorResponse.notFound("User").toJson()

        return PublicUserProfileResponse.from(user).toJson()
    }
}