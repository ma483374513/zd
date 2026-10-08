TYPE S_料盘管理输出 :
STRUCT
	(* 状态输出 *)
    满料信号 : BOOL;                      // 满料状态信号
    无料信号 : BOOL;                      // 无料状态信号
    当前点位坐标 : S_点位行列坐标;            // 当前点位坐标
    
END_STRUCT
END_TYPE
