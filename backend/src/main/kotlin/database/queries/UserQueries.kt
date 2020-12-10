package src.database.queries

import src.data.Id
import src.data.UserData
import src.data.UserPublicData
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.PublicUser
import src.database.dbitems.toItem
import src.database.dbitems.toPublicItem

class UserQueries(private val publicDb: PublicDb,
                  private val userCollection: FirestoreCollection<UserData>) {

    fun checkUsernameAvailable(username: String): Boolean
        = userCollection.getBy("username", username) == null
    fun checkEmailAvailable(email: String): Boolean
        = userCollection.getBy("email", email) == null

    fun getPublicDataById(id: Id): PublicUser?
        = userCollection.getById(id)?.toPublicItem(publicDb)
}