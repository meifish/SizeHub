package src.api.endpoints.comment

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.api.endpoints.Endpoint
import src.api.responses.CommentResponse
import src.api.responses.ErrorResponse
import src.data.Id
import src.database.PublicDb
import src.database.dbitems.Comment

@Serializable
class GetRepliesArgs(val postId: Id)

@Serializable
class GetRepliesResponse(val comments: List<CommentResponse>) {
    companion object{
        fun from(comments: List<Comment>) = GetRepliesResponse(comments.map { CommentResponse.from(it) })
    }

    fun toJson() = Json.encodeToString(this)
}

class GetRepliesEndpoint(private val publicDb: PublicDb) : Endpoint {

    override val path = "/replies"

    override fun handle(jsonInput: String): String {
        val input = json.decodeFromString<GetRepliesArgs>(jsonInput)

        val post = publicDb.posts.getById(input.postId)
            ?: return ErrorResponse.postNotFound().error

        return GetRepliesResponse.from(post.getReplies()).toJson()
    }
}