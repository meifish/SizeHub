package src.api.endpoints.post

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.Endpoint
import src.api.responses.DetailedPostResponse
import src.api.responses.ErrorResponse
import src.data.Id
import src.database.PublicDb

@Serializable
class GetDetailedPostArgs(val postId: Id)

class GetDetailedPostEndpoint(private val publicDb: PublicDb) : Endpoint{

    override val path = "/post"

    override fun handle(jsonInput: String): String {
        val args = json.decodeFromString<GetDetailedPostArgs>(jsonInput)

        val post = publicDb.getPostById(args.postId)
            ?: return ErrorResponse.postNotFound().toJson()

        return DetailedPostResponse.from(post).toJson()
    }
}