package src.database.dbitems

import src.data.Id
import src.data.UserData
import src.database.DataIdPair
import src.database.PublicDb

class User(private val publicDb: PublicDb,
           override val id: Id,
           override val data: UserData) : DbItem<UserData> {

    fun toPublicUser() = PublicUser(publicDb, id, data.toPublicUserData())

    fun getPosts(): List<Post> = publicDb.posts.getByUser(id)
}

fun DataIdPair<UserData>.toItem(publicDb: PublicDb) = User(publicDb, id, data)