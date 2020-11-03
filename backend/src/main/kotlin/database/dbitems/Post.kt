package src.database.dbitems

import src.data.ClothingItemData
import src.data.Id
import src.data.PostData
import src.database.DataIdPair
import src.database.SizeHubDb

class Post(override val id: Id,
           override val data: PostData,
           private val sizeHubDb: SizeHubDb) : DbItem<PostData> {

    fun getClothingItem(): ClothingItem?
            = sizeHubDb.clothingItemDb.getById(data.itemId)?.wrap(data.itemId)
}

fun PostData.wrap(id: Id, sizeHubDb: SizeHubDb) = Post(id, this, sizeHubDb)
fun DataIdPair<PostData>.toItem(sizeHubDb: SizeHubDb) = Post(id, data, sizeHubDb)