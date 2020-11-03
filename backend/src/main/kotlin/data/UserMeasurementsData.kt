package src.data

import kotlinx.serialization.Serializable

@Serializable
data class UserMeasurementsData(val height: Int?,
                                val weight: Int?)