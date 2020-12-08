package src.api.responses

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.data.Id
import src.database.dbitems.Post

@Serializable
class PostPreviewResponse(val postId: Id,
                          val user: PublicUserResponse?,
                          val photoUrls: List<String>) {

    companion object{
        fun from(post: Post) = PostPreviewResponse(
            post.id,
            post.getPublicUser()?.let { PublicUserResponse.from(it) },
            post.data.photoUrls,
        )
    }

    fun toJson() = Json.encodeToString(this)
}