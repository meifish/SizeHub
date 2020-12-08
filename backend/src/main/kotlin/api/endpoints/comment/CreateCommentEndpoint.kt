package src.api.endpoints.comment

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.AuthEndpoint
import src.api.endpoints.Endpoint
import src.api.endpoints.Token
import src.api.responses.CommentResponse
import src.api.responses.ErrorResponse
import src.data.Id
import src.database.PublicDb
import src.database.dbitems.User

@Serializable
class CreateCommentArgs(val token: String,
                        val postId: Id,
                        private val comment: String){

    fun toMutatorArgs() = src.database.mutators.CreateCommentArgs(postId, comment)
}

class CreateCommentEndpoint(publicDb: PublicDb) : AuthEndpoint(publicDb) {

    override val path = "/createComment"

    override fun handle(jsonInput: String, user: User): String {
        val input = json.decodeFromString<CreateCommentArgs>(jsonInput)

        val post = publicDb.posts.getById(input.postId)
            ?: return ErrorResponse.postNotFound().toJson()
        val comment = publicDb.createComment(input.token, input.toMutatorArgs())
            ?: return ErrorResponse("Failed to create comment").toJson()

        return CommentResponse.from(comment).toJson()
    }
}