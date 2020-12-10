package src.database.mutators

import src.data.ClothingItemData
import src.database.FirestoreCollection
import src.database.PublicDb
import src.database.dbitems.ClothingItem
import src.database.dbitems.toItem

class CreateClothingItemMutator(private val clothingItemCollection: FirestoreCollection<ClothingItemData>,
                                private val publicDb: PublicDb) {

    operator fun invoke(clothingItemData: ClothingItemData): ClothingItem? {
        clothingItemData.brandId?.let {
            if (publicDb.brands.getById(it) == null) return null
        }
        return clothingItemCollection.create(clothingItemData)?.toItem(publicDb)
    }
}