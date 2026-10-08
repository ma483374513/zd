TYPE S_料盘取放料附加动作 :
STRUCT
	模式:INT;//0:关闭 1:轴偏移取料 2:气缸取料 3:轴变速
	索引:INT;//轴偏移取料轴索引
	偏移值:REAL;
	速度:REAL:=10;
	加速度:REAL:=10;
	减速度:REAL:=10;
END_STRUCT
END_TYPE
