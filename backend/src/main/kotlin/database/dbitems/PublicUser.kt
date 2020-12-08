package src.database.dbitems

import src.data.Id
import src.data.UserData
import src.data.UserPublicData
import src.database.DataIdPair
import src.database.PublicDb

class PublicUser(private val publicDb: PublicDb,
                 override val id: Id,
                 override val data: UserPublicData) : DbItem<UserPublicData> {

    fun getPosts(): List<Post> = publicDb.posts.getByUser(id)
}

fun DataIdPair<UserData>.toPublicItem(publicDb: PublicDb)
    = PublicUser(publicDb, id, data.toPublicUserData())