package src.api.endpoints.comment

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.encodeToString
import src.api.endpoints.Endpoint
import src.data.Id
import src.database.PublicDb

@Serializable
class GetRepliesArgs(val postId: Id)

class GetRepliesEndpoint(private val publicDb: PublicDb) : Endpoint {

    override val path = "/replies"

    override fun handle(jsonInput: String): String {
        val input = json.decodeFromString<GetRepliesArgs>(jsonInput)
        //TODO: token check
        return json.encodeToString(publicDb.getReplies(input.postId).map { it.data })
    }
}