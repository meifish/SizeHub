package src.database.dbitems

import src.data.Id
import src.data.PostData
import src.database.DataIdPair
import src.database.PublicDb

class Post(override val id: Id,
           override val data: PostData,
           private val publicDb: PublicDb) : DbItem<PostData> {

    fun getClothingItem(): ClothingItem? = data.clothingItemId?.let { publicDb.getClothingItemById(it) }

    fun getReplies() = publicDb.getReplies(id)

    fun getUser() = publicDb.getUserById(id)
}

fun DataIdPair<PostData>.toItem(publicDb: PublicDb) = Post(id, data, publicDb)