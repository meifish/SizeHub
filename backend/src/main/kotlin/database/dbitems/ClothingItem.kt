package src.database.dbitems

import src.data.ClothingItemData
import src.data.Id
import src.database.DataIdPair
import src.database.SizeHubDb

class ClothingItem(override val id: Id,
                   override var data: ClothingItemData) : DbItem<ClothingItemData>

fun ClothingItemData.wrap(id: Id) = ClothingItem(id, this)
fun DataIdPair<ClothingItemData>.toItem() = ClothingItem(id, data)