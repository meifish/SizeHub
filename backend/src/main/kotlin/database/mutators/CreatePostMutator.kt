package src.database.mutators

import src.data.Id
import src.data.PostData
import src.data.UserMeasurementsData
import src.database.FirestoreCollection
import src.database.ProtectedDb
import src.database.dbitems.Post
import src.database.dbitems.toItem

class CreatePostArgs(val clothingItemId: Id? = null,
                     val clothingItemSize: String? = null,
                     val userMeasurementsData: UserMeasurementsData? = null,
                     val photoUrls: List<String>,
                     val comment: String){

    fun toPostData(userId: String, createdAt: String) = PostData(
        userId, clothingItemId, clothingItemSize,
        userMeasurementsData, photoUrls, comment, createdAt)
}

class CreatePostMutator(private val postCollection: FirestoreCollection<PostData>,
                        private val protectedDb: ProtectedDb) {

    operator fun invoke(token: String, createPostArgs: CreatePostArgs): Post?{
        val user = protectedDb.getUser(token) ?: return null
        val postData = createPostArgs.toPostData(user.id, System.currentTimeMillis().toString())
        return postCollection.create(postData)?.toItem(protectedDb)
    }
}