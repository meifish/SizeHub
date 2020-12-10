package src

import src.database.Database
import src.database.datagenerators.LuluLemonDatasetUploaderV2
import src.jobs.TrendingPageUpdater
import src.server.Router
import src.server.Server

fun main() {
    val database = Database()
    val router = Router(database.publicDb)
    val server = Server(router)

    TrendingPageUpdater(database.publicDb, router.trendingPageHandler).start()
}