package src.database

import src.auth.AdminBackdoorAuthService
import src.auth.AuthService
import src.auth.FirebaseAuthService
import src.auth.MultiAuthService
import src.data.*
import src.database.dbitems.*
import src.database.mutators.*

//Protected functionality. Only available to trusted objects
class ProtectedDb(private val clothingItemCollection: FirestoreCollection<ClothingItemData>,
                  private val postCollection: FirestoreCollection<PostData>,
                  private val brandCollection: FirestoreCollection<BrandData>,
                  private val userCollection: FirestoreCollection<UserData>,
                  private val commentCollection: FirestoreCollection<CommentData>) {

    //TODO: Remove admin backdoor
    private val authService = MultiAuthService(listOf(AdminBackdoorAuthService(), FirebaseAuthService()))

    fun validateToken(token: String) = authService.validateToken(token) != null
    fun getUser(token: String): User?{
        val email = authService.validateToken(token) ?: return null
        return userCollection.getBy("email", email)?.toItem(this)
    }

    val createBrand = CreateBrandMutator(brandCollection)
    val createClothingItem = CreateClothingItemMutator(clothingItemCollection, this)
    val createPost = CreatePostMutator(postCollection, this)
    val createUser = CreateUserMutator(userCollection, this)
    val createComment = CreateCommentMutator(commentCollection, this)

    fun getBrandById(id: Id): Brand? = brandCollection.getById(id)?.toItem()
    fun getClothingItemById(id: Id): ClothingItem? = clothingItemCollection.getById(id)?.toItem(this)
    //TODO: PROTECT WITH PRIVACY SETTINGS / TOKEN CHECK
    fun getPostById(id: Id): Post? = postCollection.getById(id)?.toItem(this)
    //TODO: RETURN DIFFERENT LEVEL OF DATA BASED ON PRIVACY SETTINGS/PERMISSION
    fun getPublicUser(userId: Id) = userCollection.getById(userId)?.toPublicItem(this)

    fun getBrands(): List<Brand> = brandCollection.getAll().map { it.toItem() }

    fun getReplies(postId: Id): List<Comment>
            = commentCollection.getAll().filter { it.data.postId == postId }.map { it.toItem(this) }

    fun searchBrandByName(name: String): Brand? = brandCollection.getBy("name", name)?.toItem()
    fun searchItemByName(name: String): ClothingItem? = clothingItemCollection.getBy("name", name)?.toItem(this)
    fun searchItemsByBrand(brandId: Id): List<ClothingItem>
            = clothingItemCollection.getAllBy("brandId", brandId).map { it.toItem(this) }
    fun searchItemByNameAndBrand(brandId: Id?, name: String): ClothingItem?
            = clothingItemCollection.getAllBy("name", name).find { it.data.brandId == brandId }?.toItem(this)
    fun searchPostsByUserAndClothingItem(userId: Id, clothingItemId: Id): List<Post>
            = searchPostsByUser(userId)
        .filter { it.data.clothingItemId == clothingItemId }
    fun searchPostsByUser(userId: Id): List<Post>
            = postCollection.getAllBy("userId", userId)
        .map { it.toItem(this) }

    fun checkUsernameAvailable(name: String): Boolean = userCollection.getBy("username", name) == null
    fun checkEmailAvailable(email: String): Boolean = userCollection.getBy("email", email) == null
}