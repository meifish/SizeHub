package src.api.responses

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.data.Id
import src.database.dbitems.ClothingItem

@Serializable
class ClothingItemResponse(val clothingItemId: Id,
                           val brand: BrandResponse?,
                           val name: String,
                           val category: String) {

    companion object {

        fun from(clothingItem: ClothingItem) = ClothingItemResponse(
            clothingItem.id,
            clothingItem.getBrand()?.let { BrandResponse.from(it) },
            clothingItem.data.name,
            clothingItem.data.name
        )
    }

    fun toJson() = Json.encodeToString(this)
}