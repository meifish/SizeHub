package src.database.dbitems

import src.data.Id
import src.data.PostData
import src.database.DataIdPair
import src.database.ProtectedDb

class Post(override val id: Id,
           override val data: PostData,
           private val protectedDb: ProtectedDb) : DbItem<PostData> {

    fun getClothingItem(): ClothingItem? = data.clothingItemId?.let { protectedDb.getClothingItemById(it) }

    fun getReplies() = protectedDb.getReplies(id)

    fun getPublicUser() = protectedDb.getPublicUser(id)
}

fun DataIdPair<PostData>.toItem(protectedDb: ProtectedDb) = Post(id, data, protectedDb)