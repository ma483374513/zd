TYPE S_多料盘管理输入 :
STRUCT
	手自动:BOOL;
	
	暂停	:BOOL;
	复位	:BOOL;
	急停	:BOOL;
	报警清除:BOOL;
	//料盘管理输入	:ARRAY[0..gvl_常量.最大料盘数量-1] OF S_料盘管理输入;
	
	料盘选择	:UINT;
	目标点位 : S_点位行列坐标;                // 目标点位坐标
	
	设置料盘为满料 : BOOL;       
	设置料盘为空料 : BOOL;                
	设置点位状态信号 : BOOL;              // 设置点位状态信号
	设置状态 : E_点位状态;                // 设置的状态值
	
    取料 : BOOL;            
	放料 : BOOL;         
    
    定位:BOOL;
    定位号:UINT;
    
	到初始位:BOOL;
	
	取料完成:BOOL;
	放料完成:BOOL;
END_STRUCT
END_TYPE
