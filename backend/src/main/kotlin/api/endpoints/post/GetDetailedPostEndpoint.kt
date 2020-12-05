package src.api.endpoints.post

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import src.api.endpoints.Endpoint
import src.api.responses.DetailedPostResponse
import src.api.responses.ErrorResponse
import src.api.responses.Response
import src.data.ClothingItemData
import src.data.Id
import src.data.UserData
import src.data.UserMeasurementsData
import src.database.PublicDb

@Serializable
class GetDetailedPostArgs(val postId: Id)

class GetDetailedPostEndpoint(private val publicDb: PublicDb) : Endpoint{

    override val path = "/post"

    override fun handle(jsonInput: String): Response {
        val args = json.decodeFromString<GetDetailedPostArgs>(jsonInput)

        val post = publicDb.getPostById(args.postId)
            ?: return ErrorResponse.postNotFound()

        return DetailedPostResponse.from(post)
    }
}