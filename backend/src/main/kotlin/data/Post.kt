package src.data

class Post(val id: Id,
           val userId: Id,
           val itemId: Id,
           val comment: String){

    fun getItem(): ClothingItem? = null //TODO
}