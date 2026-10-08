TYPE S_多料盘管理输入HMI :
STRUCT
	
	急停	:BOOL;
	报警清除:BOOL;
	料盘选择	:UINT;
	目标点位 : S_点位行列坐标;                // 目标点位坐标

	设置料盘为满料 : BOOL;       
	设置料盘为空料 : BOOL;   
	定位到点位信号 : BOOL;             
	设置点位状态信号 : BOOL;              // 设置点位状态信号
	设置状态 : E_点位状态;                // 设置的状态值
	定位:BOOL;
    定位号:INT;
	到初始位:BOOL;
END_STRUCT
END_TYPE
