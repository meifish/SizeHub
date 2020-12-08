package src.database

import src.auth.AuthService
import src.data.*
import src.database.mutators.*
import src.database.queries.*

//Safe functionality. Available to the entire codebase
class PublicDb(clothingItemCollection: FirestoreCollection<ClothingItemData>,
               postCollection: FirestoreCollection<PostData>,
               brandCollection: FirestoreCollection<BrandData>,
               userCollection: FirestoreCollection<UserData>,
               commentCollection: FirestoreCollection<CommentData>,
               authService: AuthService) {

    //MUTATORS
    val createBrand = CreateBrandMutator(brandCollection)
    val createClothingItem = CreateClothingItemMutator(clothingItemCollection, this)
    val createPost = CreatePostMutator(postCollection, this)
    val createUser = CreateUserMutator(userCollection, this)
    val createComment = CreateCommentMutator(commentCollection, this)

    //QUERIES
    val auth = AuthQueries(this, userCollection, authService)
    val brands = BrandQueries(brandCollection)
    val clothingItems = ClothingItemQueries(this, clothingItemCollection)
    val comments = CommentQueries(this, commentCollection)
    val posts = PostQueries(this, postCollection)
    val users = UserQueries(this, userCollection)
}