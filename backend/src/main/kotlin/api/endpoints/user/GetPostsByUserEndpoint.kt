package src.api.endpoints.user

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.api.endpoints.Endpoint
import src.api.responses.ErrorResponse
import src.api.responses.PostPreviewResponse
import src.database.PublicDb
import src.database.dbitems.Post

enum class PostSort : Comparator<Post> {
    RECENT {
        override fun compare(o1: Post?, o2: Post?): Int {
            if(o1 == null) return 0
            if(o2 == null) return 0
            return o1.data.createdAt.compareTo(o2.data.createdAt)
        }
    },
    LIKES {
        override fun compare(o1: Post?, o2: Post?): Int {
            if(o1 == null) return 0
            if(o2 == null) return 0
            //TODO: TEMP UNTIL LIKES ARE ADDED
            return -o1.data.createdAt.compareTo(o2.data.createdAt)
        }
    },
    COMMENTS {
        override fun compare(o1: Post?, o2: Post?): Int {
            if(o1 == null) return 0
            if(o2 == null) return 0
            return o1.getReplies().count().compareTo(o2.getReplies().count())
        }
    },
}

@Serializable
class GetPostsByUserArgs(val userId: String,
                         val sort: PostSort)

@Serializable
class GetPostsByUserResponse(val posts: List<PostPreviewResponse>) {
    companion object{
        fun from(posts: List<Post>) = GetPostsByUserResponse(posts.map { PostPreviewResponse.from(it) })
    }

    fun toJson() = Json.encodeToString(this)
}

class GetPostsByUserEndpoint(private val publicDb: PublicDb) : Endpoint {

    override val path get() = "/postsByUser"

    override fun handle(jsonInput: String): String {
        val input = Json.decodeFromString<GetPostsByUserArgs>(jsonInput)

        val user = publicDb.users.getPublicDataById(input.userId)
            ?: return ErrorResponse.notFound("user").toJson()
        val posts = user.getPosts().sortedWith(input.sort)

        return GetPostsByUserResponse.from(posts).toJson()
    }
}