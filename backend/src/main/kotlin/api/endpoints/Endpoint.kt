package src.api.endpoints

import kotlinx.serialization.json.Json

interface Endpoint {

    val json get() = Json {
        ignoreUnknownKeys = true
    }

    fun handle(jsonInput: String): String
}