package src.database.dbitems

import src.data.ClothingItemData
import src.data.Id
import src.database.DataIdPair
import src.database.ProtectedDb
import src.database.PublicDb

class ClothingItem(override val id: Id,
                   override var data: ClothingItemData,
                   private val protectedDb: ProtectedDb) : DbItem<ClothingItemData>{

    fun getBrand(): Brand? = data.brandId?.let { protectedDb.getBrandById(id) }
}

fun DataIdPair<ClothingItemData>.toItem(protectedDb: ProtectedDb) = ClothingItem(id, data, protectedDb)