package src.database.queries

import src.data.BrandData
import src.data.Id
import src.database.FirestoreCollection
import src.database.dbitems.Brand
import src.database.dbitems.toItem

class BrandQueries(private val brandCollection: FirestoreCollection<BrandData>) {

    fun getById(id: Id): Brand? = brandCollection.getById(id)?.toItem()
    fun list(): List<Brand> = brandCollection.getAll().map { it.toItem() }

    fun getByName(name: String) = brandCollection.getBy("name", name)?.toItem()
}