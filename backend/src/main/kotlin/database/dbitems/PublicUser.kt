package src.database.dbitems

import src.data.Id
import src.data.UserData
import src.data.UserPublicData
import src.database.DataIdPair
import src.database.ProtectedDb

class PublicUser(private val protectedDb: ProtectedDb, 
                 override val id: Id, 
                 override val data: UserPublicData) : DbItem<UserPublicData> {

    fun getPosts(): List<Post> = protectedDb.searchPostsByUser(id)
}

fun DataIdPair<UserData>.toPublicItem(protectedDb: ProtectedDb) = User(protectedDb, id, data)