package src.api.responses

import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import src.data.Id
import src.database.dbitems.Brand

@Serializable
class BrandResponse(val brandId: Id,
                    val name: String,
                    val websiteUrl: String?) {

    companion object{
        fun from(brand: Brand) = BrandResponse(brand.id, brand.data.name, brand.data.websiteUrl)
    }

    fun toJson() = Json.encodeToString(this)
}