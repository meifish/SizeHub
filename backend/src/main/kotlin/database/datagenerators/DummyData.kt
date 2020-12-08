package src.database.datagenerators

import src.data.*
import src.database.ProtectedDb
import src.database.dbitems.User
import kotlin.random.Random

class DummyData(private val protectedDb: ProtectedDb) {

    fun generate(){
        val gucciBrand = protectedDb.searchBrandByName("Gucci")
            ?: protectedDb.createBrand(BrandData("Gucci", "https://www.gucci.com/ca/en/"))
        val supremeBrand = protectedDb.searchBrandByName("Supreme")
            ?: protectedDb.createBrand(BrandData("Supreme", "https://www.streetwearofficial.com/collections/supreme"))
        val theGapBrand = protectedDb.searchBrandByName("The Gap")
            ?: protectedDb.createBrand(BrandData("The Gap", "https://www.gapcanada.ca/"))

        listOf(gucciBrand, supremeBrand, theGapBrand).filterNotNull().forEach { brand ->
            listOf("Red", "Green", "Blue").forEach { color ->
                listOf("T-Shirt", "Pants").forEach { item ->
                    val name = "$color $item"
                    if(protectedDb.searchItemByNameAndBrand(brand.id, name) == null) {
                        protectedDb.createClothingItem(ClothingItemData(brand.id, name, ""))
                    }
                }
            }
        }
/*
        val jeb = protectedDb.searchUserByName("Jeb24") ?: protectedDb.createUser(UserData("test@mail.com", "Jeb24"))
        val joe = protectedDb.searchUserByName("Joe1999") ?: protectedDb.createUser(UserData("test2@mail.com", "Joe1999"))

        repeat(5){
            generateRandomPost(listOf(jeb, joe).random()!!)
        }*/
    }

    fun generateRandomPost(user: User){
        val brand = protectedDb.getBrands().random()
        val item = protectedDb.searchItemsByBrand(brand.id).random()
        val measurementsData = UserMeasurementsData(
            Random.nextInt(100, 200).toString(),
            Random.nextInt(100, 200))

        //protectedDb.createPost(PostData(user.id, item.id, "4", measurementsData, emptyList(), "test comment"))
    }
}