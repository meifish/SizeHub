package src

import src.database.Database
import src.database.datagenerators.LuluLemonDatasetUploaderV2

fun main() {
    val database = Database()
    //val server = Server(database.publicDb)

    //DummyData(database.publicDb).generate()
    LuluLemonDatasetUploaderV2(database.publicDb).upload()
}