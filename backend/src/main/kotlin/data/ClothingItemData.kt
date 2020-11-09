package src.data

import kotlinx.serialization.Serializable

@Serializable
class ClothingItemData(val brandId: Id?,
                       val name: String,
                       val imageUrls: List<String>)