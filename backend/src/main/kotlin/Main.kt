package src

import src.database.Database
import src.database.datagenerators.LuluLemonDatasetUploaderV2
import src.server.Server

fun main() {
    val database = Database()
    val server = Server(database.publicDb)
}