TYPE S_多料盘管理配置 :
STRUCT
	x索引	:INT:=0;
	y索引	:INT:=1;
	z索引	:INT:=2;
	
	x速度:REAL:=50;
	x加速度:REAL:=500;
	x减速度:REAL:=500;
	
	y速度:REAL:=50;
	y加速度:REAL:=500;
	y减速度:REAL:=500;
	
// 	xy插补速度:REAL:=50;
// 	xy插补加速度:REAL:=500;
// 	xy插补减速度:REAL:=500;
	
	z速度:REAL:=50;
	z加速度:REAL:=500;
	z减速度:REAL:=500;
	
	x定位位置	:ARRAY[0..gvl_常量.最大料盘位置号数量-1] OF REAL:=[10];
	y定位位置	:ARRAY[0..gvl_常量.最大料盘位置号数量-1] OF REAL:=[10];
	z定位位置	:ARRAY[0..gvl_常量.最大料盘位置号数量-1] OF REAL:=[10];
	
	x轴待料位	:REAL:=10;
	y轴待料位	:REAL:=10;
	z轴待料位	:REAL:=10;
	
	
	
	
END_STRUCT
END_TYPE
