package src.api.responses

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.database.dbitems.User

@Serializable
class PublicUserProfileResponse(private val user: PublicUserResponse,
                                private val posts: List<PostPreviewResponse>) {
    companion object {
        fun from(user: User) = PublicUserProfileResponse(
            PublicUserResponse.from(user),
            user.getPosts().map { PostPreviewResponse.from(it) }
        )
    }

    fun toJson() = Json.encodeToString(this)
}