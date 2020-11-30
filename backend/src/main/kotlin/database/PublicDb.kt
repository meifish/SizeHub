package src.database

import src.data.*
import src.database.dbitems.*
import src.database.mutators.*

class PublicDb(private val clothingItemCollection: FirestoreCollection<ClothingItemData>,
               private val postCollection: FirestoreCollection<PostData>,
               private val brandCollection: FirestoreCollection<BrandData>,
               private val userCollection: FirestoreCollection<UserData>,
               private val commentCollection: FirestoreCollection<CommentData>) {

    val createBrand = CreateBrandMutator(brandCollection)
    val createClothingItem = CreateClothingItemMutator(clothingItemCollection, this)
    val createPost = CreatePostMutator(postCollection, this)
    val createUser = CreateUserMutator(userCollection, this)
    val createComment = CreateCommentMutator(commentCollection, this)

    fun getBrandById(id: Id): Brand? = brandCollection.getById(id)?.toItem()
    fun getClothingItemById(id: Id): ClothingItem? = clothingItemCollection.getById(id)?.toItem(this)
    fun getPostById(id: Id): Post? = postCollection.getById(id)?.toItem(this)

    fun getBrands(): List<Brand> = brandCollection.getAll().map { it.toItem() }

    fun getReplies(postId: Id): List<Comment>
            = commentCollection.getAll().filter { it.data.postId == postId }.map { it.toItem(this) }

    fun searchBrandByName(name: String): Brand? = brandCollection.getBy("name", name)?.toItem()
    fun searchItemByName(name: String): ClothingItem? = clothingItemCollection.getBy("name", name)?.toItem(this)
    fun searchItemsByBrand(brandId: Id): List<ClothingItem>
            = clothingItemCollection.getAllBy("brandId", brandId).map { it.toItem(this) }
    fun searchItemByNameAndBrand(brandId: Id?, name: String): ClothingItem?
            = clothingItemCollection.getAllBy("name", name).find { it.data.brandId == brandId }?.toItem(this)
    fun searchUserByName(name: String): User? = userCollection.getBy("username", name)?.toItem()
    fun searchPostsByUserAndClothingItem(userId: Id, itemId: Id): List<Post>
            = postCollection.getAllBy("userId", userId)
        .map { it.toItem(this) }
        .filter { it.data.itemId == itemId }
}