package src.database.dbitems

import src.data.Id
import src.data.PostData
import src.database.DataIdPair
import src.database.PublicDb

class Post(override val id: Id,
           override val data: PostData,
           private val publicDb: PublicDb) : DbItem<PostData> {

    fun getClothingItem(): ClothingItem? = data.clothingItemId?.let { publicDb.clothingItems.getById(it) }

    fun getReplies() = publicDb.comments.getReplies(id)
    fun getPublicUser() = publicDb.users.getPublicDataById(data.userId)
}

fun DataIdPair<PostData>.toItem(publicDb: PublicDb) = Post(id, data, publicDb)