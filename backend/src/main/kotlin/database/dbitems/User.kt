package src.database.dbitems

import src.data.Id
import src.data.UserData
import src.database.DataIdPair
import src.database.ProtectedDb

class User(private val protectedDb: ProtectedDb,
           override val id: Id,
           override val data: UserData) : DbItem<UserData> {

    fun getPosts(): List<Post> = protectedDb.searchPostsByUser(id)
    
    fun toPublicUser() = PublicUser(protectedDb, id, data.toPublicUserData())
}

fun DataIdPair<UserData>.toItem(protectedDb: ProtectedDb) = User(protectedDb, id, data)