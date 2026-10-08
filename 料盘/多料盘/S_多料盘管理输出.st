TYPE S_多料盘管理输出 :
STRUCT
	定位号定位到位:ARRAY[0..4] OF BOOL;
	
	初始位定位到位:BOOL;
	
	占位:DINT;
	
	到达定位位置:BOOL;
	
	复位完成:BOOL;
	暂停完成:BOOL;
	料盘运动状态:INT;
	
    (* 控制输出 *)
    移动X轴信号 : BOOL;                   // X轴移动控制信号
    移动Y轴信号 : BOOL;                   // Y轴移动控制信号
	移动Z轴信号 : BOOL;                   // Z轴移动控制信号
    目标X位置 : REAL;                     // 目标X坐标
    目标Y位置 : REAL;                     // 目标Y坐标
	目标Z位置 : REAL;                     // 目标Z坐标
    
	当前X位置 : REAL;                     // 目标X坐标
    当前Y位置 : REAL;                     // 目标Y坐标
	当前Z位置 : REAL;                     // 目标Z坐标
	
	当前X速度 : REAL;                     // 目标X坐标
    当前Y速度 : REAL;                     // 目标Y坐标
	当前Z速度 : REAL;                     // 目标Z坐标
	
    (* 错误信息 *)
	错误:BOOL;
    错误代码 : E_错误码;                       
    错误信息 : STRING(100);               // 错误描述
	
	料盘管理输出	:ARRAY[0..gvl_常量.最大料盘数量-1] OF S_料盘管理输出;
END_STRUCT
END_TYPE
