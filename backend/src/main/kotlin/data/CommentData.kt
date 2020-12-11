package src.data

import kotlinx.serialization.Serializable

@Serializable
data class CommentData(val postId: Id,
                       val userId: Id,
                       val comment: String,
                       val createdAt: String,
                       val likes: Set<Id>)