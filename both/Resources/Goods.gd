extends Resource
class_name Goods

enum GOODS {HP,SANITY,EYE}

@export var type : GOODS
@export var amount : int
@export var icon : CompressedTexture2D
@export var ingridient : Ingridient
