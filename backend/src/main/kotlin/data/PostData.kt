package src.data

import kotlinx.serialization.Serializable

@Serializable
class PostData(val userId: Id,
               val clothingItemId: Id? = null,
               val clothingItemSize: String? = null,
               val userMeasurementsData: UserMeasurementsData? = null,
               val photoUrls: List<String>,
               val location: PostLocation? = null,
               val caption: String,
               val createdAt: String)