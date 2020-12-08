package src.database.queries

import src.auth.AuthService
import src.data.UserData
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.User
import src.database.dbitems.toItem

class AuthQueries(private val publicDb: PublicDb,
                  private val userCollection: FirestoreCollection<UserData>,
                  private val authService: AuthService) {

    fun validateToken(token: String) = authService.validateToken(token) != null

    fun getUser(token: String): User? {
        val email = authService.validateToken(token) ?: return null
        return userCollection.getBy("email", email)?.toItem(publicDb)
    }
}