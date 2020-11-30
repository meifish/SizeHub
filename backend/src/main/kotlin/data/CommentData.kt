package src.data

import kotlinx.serialization.Serializable

@Serializable
class CommentData(val postId: Id,
                  val userId: Id,
                  val comment: String)