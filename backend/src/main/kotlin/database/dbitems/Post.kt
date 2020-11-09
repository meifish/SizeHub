package src.database.dbitems

import src.data.Id
import src.data.PostData
import src.database.DataIdPair
import src.database.PublicDb

class Post(override val id: Id,
           override val data: PostData,
           private val publicDb: PublicDb) : DbItem<PostData> {

    fun getClothingItem(): ClothingItem? = data.itemId?.let { publicDb.getClothingItemById(it) }
}

fun DataIdPair<PostData>.toItem(publicDb: PublicDb) = Post(id, data, publicDb)