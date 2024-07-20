extends Resource
class_name Goods

enum GOODS {HP,SANITY}

@export var type : GOODS
@export var amount : int
@export var icon : CompressedTexture2D
