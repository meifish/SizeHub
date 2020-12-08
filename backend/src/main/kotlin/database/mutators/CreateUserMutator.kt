package src.database.mutators

import src.data.UserData
import src.database.FirestoreCollection
import src.database.ProtectedDb
import src.database.dbitems.User
import src.database.dbitems.toItem

class CreateUserMutator(private val userCollection: FirestoreCollection<UserData>,
                        private val protectedDb: ProtectedDb) {

    operator fun invoke(userData: UserData): User? {
        if(!protectedDb.checkUsernameAvailable(userData.username)) return null
        if(!protectedDb.checkEmailAvailable(userData.email)) return null
        return userCollection.create(userData)?.toItem(protectedDb)
    }
}