package src.api.responses

import kotlinx.serialization.Serializable
import src.data.Id
import src.database.dbitems.Brand

@Serializable
class BrandResponse(val brandId: Id,
                    val name: String,
                    val websiteUrl: String?) : Response{

    companion object{
        fun from(brand: Brand) = BrandResponse(brand.id, brand.data.name, brand.data.websiteUrl)
    }
}