package src.database.datagenerators

import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import src.data.BrandData
import src.data.ClothingItemData
import src.data.UserData
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.toItem
import src.database.mutators.CreatePostArgs
import java.nio.file.Files
import java.nio.file.Path
import kotlin.random.Random
import kotlin.streams.asSequence

class LuluLemonDatasetUploaderV2(private val userCollection: FirestoreCollection<UserData>,
                                 private val publicDb: PublicDb) {

    val dataRootPath = Path.of("C:\\Users\\Vincent\\IdeaProjects\\major-group-project-size_hub\\backend\\data")

    fun upload(){
        val luluLemonBrand = publicDb.brands.getByName("LuluLemon")
            ?: publicDb.createBrand(BrandData("LuluLemon", "https://shop.lululemon.com/")) ?: return

        products().filter { Random.nextDouble()<0.3 }.forEach {
            val user = userCollection.getBy("username", it.modelName)?.toItem(publicDb)
                ?: publicDb.createUser(UserData("${it.modelName}@fakemail.com", it.modelName))
                ?: return@forEach

            println(user.data.username)

            val clothingItem = publicDb.clothingItems.getByNameAndBrand(luluLemonBrand.id, it.productName)
                ?: publicDb.createClothingItem(
                    ClothingItemData(luluLemonBrand.id, it.productName, it.itemCategory))
                ?: return@forEach

            println(clothingItem.data.name)

            val post = publicDb.createPost("admin-${user.data.email}", CreatePostArgs(
                clothingItem.id,
                it.modelWearSize,
                it.toUserMeasurementData(),
                it.imageUrls,
                "${clothingItem.data.name} Modelled by ${user.data.username}")
            )

            println(post)
            println()
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