package src.database.datagenerators

import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import src.data.BrandData
import src.data.ClothingItemData
import src.data.PostData
import src.data.UserData
import src.database.PublicDb
import java.nio.file.Files
import java.nio.file.Path
import kotlin.streams.asSequence

class LuluLemonDatasetUploaderV2(private val publicDb: PublicDb) {

    val dataRootPath = Path.of("C:\\Users\\Vincent\\IdeaProjects\\major-group-project-size_hub\\backend\\data")

    fun upload(){
        val luluLemonBrand = publicDb.searchBrandByName("LuluLemon")
            ?: publicDb.createBrand(BrandData("LuluLemon", "https://shop.lululemon.com/")) ?: return

        products().forEach {
            println(it.modelName)

            val user = publicDb.searchUserByName(it.modelName)
                ?: publicDb.createUser(UserData(it.modelName))
                ?: return@forEach

            println(it.productName)

            val clothingItem = publicDb.searchItemByNameAndBrand(luluLemonBrand.id, it.productName)
                ?: publicDb.createClothingItem(ClothingItemData(luluLemonBrand.id, it.productName, it.itemCategory))
                ?: return@forEach

            val post = publicDb.createPost(PostData(
                user.id,
                clothingItem.id,
                it.toUserMeasurementData(),
                it.imageUrls, "${clothingItem.data.name} Modelled by ${user.data.username}"))
        }
    }

    fun products(): Sequence<LuluLemonDatasetItem> = sequence {
        val json = Json { ignoreUnknownKeys = true }
        yieldAll(files().map { json.decodeFromString<LuluLemonDatasetItem>(
                String(Files.newInputStream(it).readAllBytes())) })
    }

    fun files(path: Path = dataRootPath): Sequence<Path> = sequence {
        if(Files.isDirectory(path)){
            yieldAll(Files.list(path).asSequence().flatMap { files(it) })
            return@sequence
        }
        yield(path)
    }
}