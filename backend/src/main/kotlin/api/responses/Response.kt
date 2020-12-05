package src.api.responses

import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

interface Response {

    fun toJson(json: Json) = json.encodeToString(this)
}