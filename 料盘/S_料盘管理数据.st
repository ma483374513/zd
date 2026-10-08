TYPE S_料盘管理数据 :
STRUCT
    点位状态 : ARRAY [0..GVL_常量.最大料盘行数-1, 0..GVL_常量.最大料盘列数-1] OF E_点位状态;
    屏蔽点位 : ARRAY [0..GVL_常量.最大料盘行数-1, 0..GVL_常量.最大料盘列数-1] OF BOOL;
END_STRUCT
END_TYPE
