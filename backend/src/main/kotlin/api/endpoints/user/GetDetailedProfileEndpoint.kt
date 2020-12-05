package src.api.endpoints.user

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.Endpoint
import src.api.responses.ErrorResponse
import src.api.responses.PublicUserProfileResponse
import src.api.responses.Response
import src.data.Id
import src.data.PostData
import src.database.PublicDb

@Serializable
class GetDetailedProfileArgs(val userId: Id)

@Serializable
class GetDetailedProfileResponse(val posts: List<PostData>)

class GetDetailedProfileEndpoint(private val publicDb: PublicDb) : Endpoint{

    override val path = "/profile"

    override fun handle(jsonInput: String): Response {
        val args = json.decodeFromString<GetDetailedProfileArgs>(jsonInput)

        //TODO: ADD TOKEN CHECKS
        val user = publicDb.getUserById(args.userId)
            ?: return ErrorResponse.notFound("user")

        return PublicUserProfileResponse.from(user)
    }
}