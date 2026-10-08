// FB_G代码插补_0(
// 	x轴:=GVL_系统变量.AXIS_数组[GVL_系统变量.多料盘管理配置.x索引]^ , 
// 	y轴:=GVL_系统变量.AXIS_数组[GVL_系统变量.多料盘管理配置.y索引]^ , 
// 	启动:=GVL_系统变量.料盘轴运动输入.插补启动 , 
// 	停止:= , 
// 	急停:= GVL_系统变量.料盘轴运动输入.插补停止, 
// 	x位置:= GVL_系统变量.料盘轴运动输入.目标位置[0], 
// 	y位置:= GVL_系统变量.料盘轴运动输入.目标位置[1], 
// 	插补速度:=GVL_系统变量.料盘轴运动输入.xy插补速度 , 
// 	加速度:=GVL_系统变量.料盘轴运动输入.xy插补加速度 , 
// 	减速度:=  GVL_系统变量.料盘轴运动输入.xy插补减速度, 
// 	x到位偏差:= , 
// 	y到位偏差:= , 
// 	周期:= 4000, 
// 	速度模式:=SM3_CNC.TRAPEZOID , 
// 	x轴位置=> , 
// 	y轴位置=> , 
// 	速度=> , 
// 	运行中=> , 
// 	定位完成=> , 
// 	错误=>GVL_系统变量.料盘轴运动输出.插补错误 , 
// 	错误码=>GVL_系统变量.料盘轴运动输出.插补错误码 );
	
MC_MoveAbsolute_0(
	Axis:= x轴 , 
	Execute:= 料盘轴运动输入.x轴定位 , 
	Position:=  料盘轴运动输入.X定位位置, 
	Velocity:= 料盘轴运动输入.X定位速度 , 
	Acceleration:=  料盘轴运动输入.X定位加速度, 
	Deceleration:=  料盘轴运动输入.X定位减速度, 
	Jerk:=1000000 , 
	Direction:= , 
	BufferMode:= , 
	Done=> , 
	Busy=> , 
	Active=> , 
	CommandAborted=> , 
	Error=>料盘轴运动输出.x定位错误 , 
	ErrorID=>料盘轴运动输出.x定位错误码 );
MC_MoveAbsolute_1(
	Axis:= y轴 , 
	Execute:=  料盘轴运动输入.y轴定位 , 
	Position:= 料盘轴运动输入.Y定位位置, 
	Velocity:= 料盘轴运动输入.y定位速度 , 
	Acceleration:=  料盘轴运动输入.y定位加速度, 
	Deceleration:=  料盘轴运动输入.y定位减速度, 
	Jerk:=1000000 , 
	Direction:= , 
	BufferMode:= , 
	Done=> , 
	Busy=> , 
	Active=> , 
	CommandAborted=> , 
	Error=> 料盘轴运动输出.y定位错误, 
	ErrorID=>料盘轴运动输出.y定位错误码 );
// MC_MoveAbsolute_2(
// 	Axis:= z轴 , 
// 	Execute:=  料盘轴运动输入.Z轴定位 , 
// 	Position:=  料盘轴运动输入.z定位位置, 
// 	Velocity:= 料盘轴运动输入.z定位速度 , 
// 	Acceleration:=  料盘轴运动输入.z定位加速度, 
// 	Deceleration:= 料盘轴运动输入.z定位减速度, 
// 	Jerk:=1000000 , 
// 	Direction:= , 
// 	BufferMode:= , 
// 	Done=> , 
// 	Busy=> , 
// 	Active=> , 
// 	CommandAborted=> , 
// 	Error=> 料盘轴运动输出.z定位错误, 
// 	ErrorID=> 料盘轴运动输出.z定位错误码);
MC_Move_ChangePosVel_Pul_2(
	Ax轴:=z轴 , 
	x启动:= 料盘轴运动输入.Z轴定位, 
	f位置:=料盘轴运动输入.z定位位置 , 
	f速度:= 料盘轴运动输入.z定位速度, 
	f加速度:= 料盘轴运动输入.z定位加速度, 
	f减速度:=料盘轴运动输入.z定位减速度 , 
	x运行中=> , 
	x定位完成=> , 
	x错误=>料盘轴运动输出.z定位错误 , 
	s错误码=> );
	
MC_Stop_1(
	Axis:=x轴 , 
	Execute:= 料盘轴运动输入.x轴停止 , 
	Deceleration:= 10000000);
MC_Stop_2(
	Axis:= y轴 , 
	Execute:= 料盘轴运动输入.y轴停止, 
	Deceleration:= 10000000);
MC_Stop_3(
	Axis:= z轴 , 
	Execute:= 料盘轴运动输入.z轴停止, 
	Deceleration:= 10000000);
	
// MC_ReadStatus_0(Axis:=x轴 , Enable:=x轴.wCommunicationState=100 , );	
// MC_ReadStatus_1(Axis:=x轴 , Enable:=y轴.wCommunicationState=100 , );	
// MC_ReadStatus_2(Axis:=x轴 , Enable:=z轴.wCommunicationState=100 , );	
// //轴报错复位
// MC_Reset_0(Axis:= x轴, Execute:=x轴.nAxisState = 1   AND  MC_ReadStatus_0.FBErrorOccured);	
// MC_Reset_1(Axis:= y轴, Execute:=y轴.nAxisState = 1   AND  MC_ReadStatus_0.FBErrorOccured);	
// MC_Reset_2(Axis:= z轴, Execute:=z轴.nAxisState = 1   AND  MC_ReadStatus_0.FBErrorOccured);	

