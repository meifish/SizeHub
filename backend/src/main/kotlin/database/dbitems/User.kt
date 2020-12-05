package src.database.dbitems

import src.data.Id
import src.data.UserData
import src.database.DataIdPair
import src.database.PublicDb

class User(private val publicDb: PublicDb,
           override val id: Id,
           override val data: UserData) : DbItem<UserData> {

    fun getPosts(): List<Post> = publicDb.searchPostsByUser(id)
}

fun DataIdPair<UserData>.toItem(publicDb: PublicDb) = User(publicDb, id, data)