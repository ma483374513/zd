TYPE S_位置号附加动作 :
STRUCT
	位置号附加动作: INT;//0:关闭 1:轴偏移
	索引: INT;
	偏移值: REAL;
	速度:REAL:=10;
	加速度:REAL:=10;
	减速度:REAL:=10;
END_STRUCT
END_TYPE
