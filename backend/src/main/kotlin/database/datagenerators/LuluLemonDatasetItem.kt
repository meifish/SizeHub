package src.database.datagenerators

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable
import src.data.UserMeasurementsData

@Serializable
class LuluLemonDatasetItem (@SerialName("model") val modelName: String = "Anonymous",
                            @SerialName("model_height") val modelHeight: String? = null,
                            @SerialName("model_wear_size") val modelWearSize: String? = null,
                            @SerialName("product_title") val productName: String,
                            @SerialName("category")  val itemCategory: String,
                            @SerialName("img_urls") val imageUrls: List<String>){

    fun toUserMeasurementData(): UserMeasurementsData? {
        modelHeight?.let {
            modelWearSize?.let {
                return UserMeasurementsData(modelHeight.replace("\u2019", "'"), 120, modelWearSize)
            }
        }
        return null
    }

    override fun toString(): String {
        return "LuluLemonDatasetItem(modelName='$modelName', " +
                "modelHeight=$modelHeight, " +
                "modelWearSize=$modelWearSize, " +
                "productName='$productName', " +
                "itemCategory='$itemCategory', " +
                "imageUrls=$imageUrls)"
    }
}