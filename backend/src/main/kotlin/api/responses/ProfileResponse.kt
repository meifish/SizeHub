package src.api.responses

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.database.dbitems.PublicUser
import src.database.dbitems.User

@Serializable
class ProfileResponse(private val user: UserPublicResponse,
                      private val posts: List<PostPreviewResponse>) {

    companion object {
        fun from(user: PublicUser) = ProfileResponse(
            UserPublicResponse.from(user),
            user.getPosts().map { PostPreviewResponse.from(it) }
        )
    }

    fun toJson() = Json.encodeToString(this)
}