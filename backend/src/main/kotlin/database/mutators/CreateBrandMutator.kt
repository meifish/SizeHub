package src.database.mutators

import src.data.BrandData
import src.database.FirestoreCollection
import src.database.dbitems.Brand
import src.database.dbitems.toItem

class CreateBrandMutator(private val brandCollection: FirestoreCollection<BrandData>) {

    operator fun invoke(brandData: BrandData): Brand {
        return brandCollection.create(brandData).toItem()
    }
}