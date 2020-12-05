package src.api.responses

import kotlinx.serialization.Serializable
import src.database.dbitems.User

@Serializable
class PublicUserProfileResponse(private val user: PublicUserResponse,
                                private val posts: List<PostPreviewResponse>) : Response {
    companion object {
        fun from(user: User) = PublicUserProfileResponse(
            PublicUserResponse.from(user),
            user.getPosts().map { PostPreviewResponse.from(it) }
        )
    }
}