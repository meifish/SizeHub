package src

import src.database.Database
import src.database.datagenerators.LuluLemonDatasetUploader
import java.nio.file.Files
import java.nio.file.Path
import java.util.*
import javax.imageio.ImageIO

fun main() {
    val database = Database()

    //DummyData(database.publicDb).generate()
    //LuluLemonDatasetUploader(database.publicDb).upload()
}