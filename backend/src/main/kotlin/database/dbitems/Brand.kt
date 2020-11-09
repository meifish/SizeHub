package src.database.dbitems

import src.data.BrandData
import src.data.Id
import src.database.DataIdPair

class Brand(override val id: Id,
            override var data: BrandData) : DbItem<BrandData>

fun DataIdPair<BrandData>.toItem() = Brand(id, data)