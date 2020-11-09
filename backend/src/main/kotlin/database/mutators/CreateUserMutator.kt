package src.database.mutators

import src.data.UserData
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.User
import src.database.dbitems.toItem

class CreateUserMutator(private val userCollection: FirestoreCollection<UserData>,
                        private val publicDb: PublicDb) {

    operator fun invoke(userData: UserData): User? {
        if(publicDb.searchUserByName(userData.username) != null) return null
        return userCollection.create(userData).toItem()
    }
}