package src.api.responses

import kotlinx.serialization.Serializable
import src.data.Id
import src.data.UserMeasurementsData
import src.database.dbitems.Post

@Serializable
class DetailedPostResponse(val postId: Id,
                           val user: PublicUserResponse?,
                           val clothingItem: ClothingItemResponse?,
                           val clothingItemSize: String?,
                           val userMeasurementsData: UserMeasurementsData?,
                           val photoUrls: List<String>,
                           val caption: String,
                           val comments: List<CommentResponse>): Response {

    companion object{
        fun from(post: Post) = DetailedPostResponse(
            post.id,
            post.getUser()?.let { PublicUserResponse.from(it) },
            post.getClothingItem()?.let { ClothingItemResponse.from(it) },
            post.data.clothingItemSize,
            post.data.userMeasurementsData,
            post.data.photoUrls,
            post.data.comment,
            post.getReplies().map { CommentResponse.from(it) }
        )
    }
}