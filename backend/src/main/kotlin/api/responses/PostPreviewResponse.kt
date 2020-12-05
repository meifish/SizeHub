package src.api.responses

import kotlinx.serialization.Serializable
import src.data.Id
import src.database.dbitems.Post

@Serializable
class PostPreviewResponse(val postId: Id,
                          val user: PublicUserResponse?,
                          val photoUrls: List<String>): Response {

    companion object{
        fun from(post: Post) = PostPreviewResponse(
            post.id,
            post.getUser()?.let { PublicUserResponse.from(it) },
            post.data.photoUrls,
        )
    }
}