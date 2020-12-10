package src.api.responses

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.data.Id
import src.data.PostLocation
import src.data.UserMeasurementsData
import src.database.dbitems.Post

@Serializable
class DetailedPostResponse(val postId: Id,
                           val user: UserPublicResponse?,
                           val clothingItem: ClothingItemResponse?,
                           val clothingItemSize: String?,
                           val userMeasurementsData: UserMeasurementsData?,
                           val photoUrls: List<String>,
                           val location: PostLocation?,
                           val caption: String,
                           val comments: List<CommentResponse>) {

    companion object{
        fun from(post: Post) = DetailedPostResponse(
            post.id,
            post.getPublicUser()?.let { UserPublicResponse.from(it) },
            post.getClothingItem()?.let { ClothingItemResponse.from(it) },
            post.data.clothingItemSize,
            post.data.userMeasurementsData,
            post.data.photoUrls,
            post.data.location,
            post.data.caption,
            post.getReplies().map { CommentResponse.from(it) }
        )
    }

    fun toJson() = Json.encodeToString(this)
}