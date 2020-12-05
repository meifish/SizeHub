package src.api.endpoints.post

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import src.api.endpoints.Endpoint
import src.api.responses.ErrorResponse
import src.api.responses.PostPreviewResponse
import src.api.responses.Response
import src.data.Id
import src.data.PostData
import src.data.UserMeasurementsData
import src.database.PublicDb

//This class is temporarily identical to PostData (until auth is implemented)
@Serializable
class CreatePostArgs(private val userId: Id,
                     private val clothingItemId: Id? = null,
                     private val clothingItemSize: String? = null,
                     private val userMeasurementsData: UserMeasurementsData,
                     private val photoUrls: List<String>,
                     private val comment: String){

    fun toPostData() = PostData(userId, clothingItemId, clothingItemSize,
        userMeasurementsData, photoUrls, comment)
}

class CreatePostEndpoint(private val publicDb: PublicDb) : Endpoint{

    override val path = "/createPost"

    override fun handle(jsonInput: String): Response {
        val input = json.decodeFromString<CreatePostArgs>(jsonInput)
        //TODO: token check
        val post = publicDb.createPost(input.toPostData())
            ?: return ErrorResponse("Failed to create post")

        return PostPreviewResponse.from(post)
    }
}