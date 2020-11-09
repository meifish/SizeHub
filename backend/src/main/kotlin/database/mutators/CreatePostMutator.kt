package src.database.mutators

import src.data.PostData
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.Post
import src.database.dbitems.toItem

class CreatePostMutator(private val postCollection: FirestoreCollection<PostData>,
                        private val publicDb: PublicDb) {

    //TODO: token check
    operator fun invoke(postData: PostData): Post?{
        return postCollection.create(postData).toItem(publicDb)
    }
}