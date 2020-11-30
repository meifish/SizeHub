package src.data

import kotlinx.serialization.Serializable

@Serializable
class PostData(val userId: Id,
               val itemId: Id? = null,
               val userMeasurementsData: UserMeasurementsData,
               val photoUrls: List<String>,
               val comment: String)