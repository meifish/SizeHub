package src.api.endpoints

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import src.api.responses.ErrorResponse
import src.database.PublicDb
import src.database.dbitems.User

@Serializable
class Token(val token: String)

abstract class AuthEndpoint(protected val publicDb: PublicDb) : Endpoint {

    abstract fun handle(jsonInput: String, user: User): String

    override fun handle(jsonInput: String): String {
        val token = json.decodeFromString<Token>(jsonInput)
        if(!publicDb.validateToken(token.token)) return ErrorResponse.invalidToken().toJson()
        val user = publicDb.getUser(token.token)
            ?: return ErrorResponse("No user associated with the token").toJson()
        return handle(jsonInput, user)
    }
}