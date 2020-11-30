package src.database.datagenerators

import src.data.*
import src.database.PublicDb
import src.database.dbitems.User
import kotlin.random.Random

class DummyData(private val publicDb: PublicDb) {

    fun generate(){
        val gucciBrand = publicDb.searchBrandByName("Gucci")
            ?: publicDb.createBrand(BrandData("Gucci", "https://www.gucci.com/ca/en/"))
        val supremeBrand = publicDb.searchBrandByName("Supreme")
            ?: publicDb.createBrand(BrandData("Supreme", "https://www.streetwearofficial.com/collections/supreme"))
        val theGapBrand = publicDb.searchBrandByName("The Gap")
            ?: publicDb.createBrand(BrandData("The Gap", "https://www.gapcanada.ca/"))

        listOf(gucciBrand, supremeBrand, theGapBrand).filterNotNull().forEach { brand ->
            listOf("Red", "Green", "Blue").forEach { color ->
                listOf("T-Shirt", "Pants").forEach { item ->
                    val name = "$color $item"
                    if(publicDb.searchItemByNameAndBrand(brand.id, name) == null) {
                        publicDb.createClothingItem(ClothingItemData(brand.id, name, emptyList()))
                    }
                }
            }
        }

        val jeb = publicDb.searchUserByName("Jeb24") ?: publicDb.createUser(UserData("Jeb24"))
        val joe = publicDb.searchUserByName("Joe1999") ?: publicDb.createUser(UserData("Joe1999"))

        repeat(5){
            generateRandomPost(listOf(jeb, joe).random()!!)
        }
    }

    fun generateRandomPost(user: User){
        val brand = publicDb.getBrands().random()
        val item = publicDb.searchItemsByBrand(brand.id).random()
        val measurementsData = UserMeasurementsData(Random.nextInt(100, 200), Random.nextInt(100, 200))

        publicDb.createPost(PostData(user.id, item.id, measurementsData, emptyList(), "test comment"))
    }
}