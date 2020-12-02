package src.data

import kotlinx.serialization.Serializable

@Serializable
class UserMeasurementsData(val height: String,
                           val weight: Int,
                           val wearSize: String)