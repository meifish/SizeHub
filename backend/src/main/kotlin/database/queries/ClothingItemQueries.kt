package src.database.queries

import src.data.ClothingItemData
import src.data.Id
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.ClothingItem
import src.database.dbitems.toItem

class ClothingItemQueries(private val publicDb: PublicDb,
                          private val clothingItemCollection: FirestoreCollection<ClothingItemData>) {

    fun getById(id: Id): ClothingItem? = clothingItemCollection.getById(id)?.toItem(publicDb)

    fun getByNameAndBrand(brandId: Id, name: String)
        = clothingItemCollection.getAllBy("brandId", brandId).find { it.data.name == name }?.toItem(publicDb)
}