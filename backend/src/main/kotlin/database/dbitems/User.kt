package src.database.dbitems

import src.data.Id
import src.data.UserData
import src.database.DataIdPair

class User(override val id: Id,
           override val data: UserData) : DbItem<UserData>

fun DataIdPair<UserData>.toItem() = User(id, data)