package src

import src.database.Database
import src.database.DummyData

fun main() {
    val database = Database()

    DummyData(database.publicDb).generate()
}