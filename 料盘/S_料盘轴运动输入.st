TYPE S_料盘轴运动输入 :
STRUCT
	插补启动: BOOL;
	插补停止: BOOL;
	
	目标位置:ARRAY[0..1] OF REAL;
	xy插补速度:REAL;
	xy插补加速度:REAL;
	xy插补减速度:REAL;
	
	
	x轴停止:BOOL;
	y轴停止:BOOL;
	z轴停止:BOOL;
	
	x轴定位: BOOL;
	y轴定位: BOOL;
	Z轴定位: BOOL;
	
	X定位位置:REAL;
	y定位位置:REAL;
	z定位位置:REAL;
	
	X定位速度:REAL;
	y定位速度:REAL;
	z定位速度:REAL;
	
	x定位加速度:REAL;
	y定位加速度:REAL;
	z定位加速度:REAL;
	
	x定位减速度:REAL;
	y定位减速度:REAL;
	z定位减速度:REAL;
END_STRUCT
END_TYPE
