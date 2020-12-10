package src.data

import kotlinx.serialization.Serializable

@Serializable
class PostLocation(val latitude: Double,
                   val longitude: Double,
                   val cityName: String)