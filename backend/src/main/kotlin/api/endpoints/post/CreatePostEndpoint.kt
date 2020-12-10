package src.api.endpoints.post

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.AuthEndpoint
import src.api.endpoints.Endpoint
import src.api.responses.ErrorResponse
import src.api.responses.PostPreviewResponse
import src.data.Id
import src.data.UserMeasurementsData
import src.database.PublicDb
import src.database.dbitems.User

//This class is temporarily identical to PostData (until auth is implemented)
@Serializable
class CreatePostArgs(val token: String,
                     private val clothingItemId: Id? = null,
                     private val clothingItemSize: String? = null,
                     private val userMeasurementsData: UserMeasurementsData,
                     private val photoUrls: List<String>,
                     private val comment: String){

    fun toMutatorArgs() = src.database.mutators.CreatePostArgs(clothingItemId, clothingItemSize,
        userMeasurementsData, photoUrls, comment)
}

class CreatePostEndpoint(publicDb: PublicDb) : AuthEndpoint(publicDb){

    override val path = "/createPost"

    override fun handle(jsonInput: String, user: User): String {
        val input = json.decodeFromString<CreatePostArgs>(jsonInput)

        if(!publicDb.auth.validateToken(input.token)) return ErrorResponse.invalidToken().toJson()
        val post = publicDb.createPost(input.token, input.toMutatorArgs())
            ?: return ErrorResponse("Failed to create post").toJson()

        return PostPreviewResponse.from(post).toJson()
    }
}