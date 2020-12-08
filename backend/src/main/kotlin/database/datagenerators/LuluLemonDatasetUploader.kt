package src.database.datagenerators

import src.data.*
import src.database.FirestoreCollection
import src.database.PublicDb
import java.nio.file.Files
import java.nio.file.Path

class LuluLemonDatasetUploader(private val publicDb: PublicDb) {

    private val dataRootPath = Path.of("C:\\Users\\Vincent\\IdeaProjects\\major-group-project-size_hub\\backend\\data\\crawl")

    fun upload(){
        /*
        val luluLemonBrand = publicDb.searchBrandByName("LuluLemon")
            ?: publicDb.createBrand(BrandData("LuluLemon", "https://shop.lululemon.com/")) ?: return

        Files.list(dataRootPath).forEach { modelPath ->
            val modelName = modelPath.fileName.toString()
            println(modelName)

            val user = /*publicDb.searchUserByName(modelName)
                ?: */publicDb.createUser(UserData("${modelName}@fakemail.com", modelName))
                ?: return@forEach

            Files.list(modelPath).forEach ClothingLoop@{ clothingPath ->
                val clothingName = clothingPath.fileName.toString()
                println("  $clothingName")

                /*
                val clothingItem = publicDb.searchItemByNameAndBrand(luluLemonBrand.id, clothingName)
                    ?: publicDb.createClothingItem(ClothingItemData(luluLemonBrand.id, clothingName, "")
                    ?: return@ClothingLoop

                if(publicDb.searchPostsByUserAndClothingItem(user.id, clothingItem.id).isEmpty()){
                    publicDb.createPost(PostData(
                        user.id,
                        clothingItem.id,
                        UserMeasurementsData("123", 120, "456"),
                        listOf("https://image.shutterstock.com/image-illustration/red-stamp-on-white-background-260nw-1165179109.jpg"),
                        "temp comment"))
                }*/
            }
        }*/
    }
}