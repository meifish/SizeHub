package src.api.endpoints.comment

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import src.api.endpoints.Endpoint
import src.api.responses.CommentResponse
import src.api.responses.ErrorResponse
import src.api.responses.Response
import src.data.CommentData
import src.data.Id
import src.database.PublicDb
import src.database.dbitems.Comment

@Serializable
class GetRepliesArgs(val postId: Id)

@Serializable
class GetRepliesResponse(val comments: List<CommentResponse>) : Response {
    companion object{
        fun from(comments: List<Comment>) = GetRepliesResponse(comments.map { CommentResponse.from(it) })
    }
}

class GetRepliesEndpoint(private val publicDb: PublicDb) : Endpoint {

    override val path = "/replies"

    override fun handle(jsonInput: String): Response {
        val input = json.decodeFromString<GetRepliesArgs>(jsonInput)
        //TODO: token check
        val post = publicDb.getPostById(input.postId)
            ?: return ErrorResponse.postNotFound()

        return GetRepliesResponse.from(post.getReplies())
    }
}