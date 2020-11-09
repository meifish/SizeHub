package src.database.dbitems

import src.data.ClothingItemData
import src.data.Id
import src.database.DataIdPair
import src.database.PublicDb

class ClothingItem(override val id: Id,
                   override var data: ClothingItemData,
                   private val publicDb: PublicDb) : DbItem<ClothingItemData>{

    fun getBrand(): Brand? = data.brandId?.let { publicDb.getBrandById(id) }
}

fun DataIdPair<ClothingItemData>.toItem(publicDb: PublicDb) = ClothingItem(id, data, publicDb)