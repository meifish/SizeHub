package src.database.dbitems

import src.data.Id

interface DbItem<T> {
    val id: Id
    val data: T
}