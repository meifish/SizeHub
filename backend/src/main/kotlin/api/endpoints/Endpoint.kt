package src.api.endpoints

import kotlinx.serialization.json.Json
import src.api.responses.Response

interface Endpoint {

    val path: String

    val json get() = Json {
        ignoreUnknownKeys = true
    }

    fun handle(jsonInput: String): Response
}