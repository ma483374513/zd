TYPE S_料盘配置 :
STRUCT
	行数 : INT:=10;                  // 料盘实际行数
	列数 : INT:=15;                  // 料盘实际列数
	行间距 : REAL:=20;               // 点位行间距(mm)
	列间距 : REAL:=20;               // 点位列间距(mm)
	起始X坐标 : REAL:=10;            // 料盘第一点X坐标(mm)
	起始Y坐标 : REAL:=10;            // 料盘第一点Y坐标(mm)
	Z轴高度 : REAL:=8;              // 料盘Z轴高度(mm)
	
	点位偏移:ARRAY[0..gvl_常量.最大料盘行数-1,0..gvl_常量.最大料盘列数-1] OF S_点位偏移;
	放料起始X坐标 : REAL:=10;            // 料盘第一点X坐标(mm)
	放料起始Y坐标 : REAL:=10;            // 料盘第一点Y坐标(mm)
	放料Z轴高度 : REAL:=8;              // 料盘Z轴高度(mm)
	

END_STRUCT
END_TYPE
