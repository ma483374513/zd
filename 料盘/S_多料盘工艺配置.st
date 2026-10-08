TYPE S_多料盘工艺配置 :
STRUCT
		位置号附加动作	:ARRAY[0..gvl_常量.最大料盘位置号数量-1] OF S_位置号附加动作;
		位置号z轴下降减速:ARRAY[0..gvl_常量.最大料盘位置号数量-1] OF S_位置号z轴下降减速;
END_STRUCT
END_TYPE
