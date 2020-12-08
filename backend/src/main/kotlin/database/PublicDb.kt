package src.database

import src.data.*
import src.database.dbitems.Brand
import src.database.dbitems.User
import src.database.dbitems.toItem
import src.database.dbitems.toPublicItem
import src.database.mutators.*

//Safe functionality. Available to the entire codebase
class PublicDb(private val protectedDb: ProtectedDb) {

    val createPost get() = protectedDb.createPost
    val createUser get() = protectedDb.createUser
    val createComment get() = protectedDb.createComment

    //TODO: TOKEN CHECK AND PRIVACY SETTINGS FOR POST
    fun getPostById(id: Id) = protectedDb.getPostById(id)
    fun getPublicUser(id: Id) = protectedDb.getPublicUser(id)
    fun getUser(token: String) = protectedDb.getUser(token)
    fun validateToken(token: String) = protectedDb.validateToken(token)
}