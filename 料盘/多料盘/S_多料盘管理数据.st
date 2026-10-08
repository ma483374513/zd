TYPE S_多料盘管理数据 :
STRUCT
	料盘管理数据	:ARRAY[0..gvl_常量.最大料盘数量-1] OF S_料盘管理数据;
END_STRUCT
END_TYPE
