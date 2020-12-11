package src.api.endpoints.user

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import src.api.endpoints.AuthEndpoint
import src.api.endpoints.Endpoint
import src.api.responses.ErrorResponse
import src.api.responses.ProfileResponse
import src.data.Id
import src.data.PostData
import src.database.PublicDb
import src.database.dbitems.User

class GetDetailedProfileEndpoint(publicDb: PublicDb) : AuthEndpoint(publicDb){

    override val path get() = "/profile"

    override fun handle(jsonInput: String, user: User): String {
        return ProfileResponse.from(user.toPublicUser()).toJson()
    }
}