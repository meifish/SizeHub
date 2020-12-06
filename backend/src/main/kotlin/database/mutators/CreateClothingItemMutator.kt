package src.database.mutators

import src.data.ClothingItemData
import src.database.FirestoreCollection
import src.database.ProtectedDb
import src.database.dbitems.ClothingItem
import src.database.dbitems.toItem

class CreateClothingItemMutator(private val clothingItemCollection: FirestoreCollection<ClothingItemData>,
                                private val protectedDb: ProtectedDb) {

    operator fun invoke(clothingItemData: ClothingItemData): ClothingItem? {
        clothingItemData.brandId?.let {
            if (protectedDb.getBrandById(it) == null) return null
        }
        return clothingItemCollection.create(clothingItemData)?.toItem(protectedDb)
    }
}