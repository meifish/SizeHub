package src.database.mutators

import src.data.Id
import src.data.PostData
import src.data.UserMeasurementsData
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.Post
import src.database.dbitems.toItem

class CreatePostArgs(private val clothingItemId: Id? = null,
                     private val clothingItemSize: String? = null,
                     private val userMeasurementsData: UserMeasurementsData? = null,
                     private val photoUrls: List<String>,
                     val comment: String) {

    fun toPostData(userId: String, createdAt: String) = PostData(
        userId, clothingItemId, clothingItemSize,
        userMeasurementsData, photoUrls, comment, createdAt
    )
}

class CreatePostMutator(private val postCollection: FirestoreCollection<PostData>,
                        private val publicDb: PublicDb) {

    operator fun invoke(token: String, createPostArgs: CreatePostArgs): Post?{
        val user = publicDb.auth.getUser(token) ?: return null
        val postData = createPostArgs.toPostData(user.id, System.currentTimeMillis().toString())
        return postCollection.create(postData)?.toItem(publicDb)
    }
}