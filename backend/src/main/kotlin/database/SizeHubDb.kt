package src.database

import src.data.ClothingItemData
import src.data.PostData

class SizeHubDb(val clothingItemDb: ReadOnlyFirestoreCollection<ClothingItemData>,
                val postDb: ReadOnlyFirestoreCollection<PostData>)