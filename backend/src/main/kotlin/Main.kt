package src

import src.database.Database
import src.server.Server

fun main() {
    val database = Database()
    val server = Server(database.publicDb)

    //DummyData(database.publicDb).generate()
    //LuluLemonDatasetUploader(database.publicDb).upload()
}