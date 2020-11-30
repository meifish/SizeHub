package src.api.endpoints.comment

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import src.api.endpoints.Endpoint
import src.data.CommentData
import src.data.Id
import src.database.PublicDb

@Serializable
class GetRepliesArgs(val postId: Id)

@Serializable
class GetRepliesResponse(val comments: List<CommentData>)

class GetRepliesEndpoint(private val publicDb: PublicDb) : Endpoint {

    override val path = "/replies"

    override fun handle(jsonInput: String): String {
        val input = json.decodeFromString<GetRepliesArgs>(jsonInput)
        //TODO: token check
        return json.encodeToString(GetRepliesResponse(publicDb.getReplies(input.postId).map { it.data }))
    }
}