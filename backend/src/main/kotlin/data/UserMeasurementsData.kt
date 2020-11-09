package src.data

import kotlinx.serialization.Serializable

@Serializable
class UserMeasurementsData(val height: Int,
                           val weight: Int)