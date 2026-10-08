//读取轴状态功能块
x轴状态(Axis:= x轴, Enable:=x轴.wCommunicationState=100);
y轴状态(Axis:= y轴, Enable:=y轴.wCommunicationState=100);
z轴状态(Axis:= z轴, Enable:=z轴.wCommunicationState=100);


手动急停上升沿(CLK:=多料盘管理输入HMI.急停 AND NOT 多料盘管理输入.手自动 , Q=> );

IF 手动急停上升沿.Q THEN
	放料流程:=0;
	取料流程:=0;
	定位流程:=0;
	手动定位流程:=0;
	指定取料流程:=0;
	指定放料流程:=0;
	手动取料流程:=0;
	手动放料流程:=0;
	多料盘管理输出.料盘运动状态:=E_料盘运动状态.待机;
	料盘轴运动输入.x轴定位:=FALSE;
	料盘轴运动输入.y轴定位:=FALSE;
	料盘轴运动输入.Z轴定位:=FALSE;
	料盘轴运动输入.插补启动:=FALSE;
	多料盘管理输出.错误:=FALSE;
    多料盘管理输出.错误信息 :='';
END_IF

IF 多料盘管理输入HMI.急停 THEN
	IF (FC_误差判断(实际值:=x轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE OR
		FC_误差判断(实际值:=y轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE) 
		AND x轴状态.SynchronizedMotion AND y轴状态.SynchronizedMotion THEN
		料盘轴运动输入.插补停止:=TRUE;
	END_IF
	IF FC_误差判断(实际值:=x轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE 
		AND (x轴状态.DiscreteMotion OR x轴状态.ContinuousMotion) THEN
		料盘轴运动输入.x轴停止:=TRUE;
	END_IF
	IF FC_误差判断(实际值:=y轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE
		AND (y轴状态.DiscreteMotion OR y轴状态.ContinuousMotion) THEN
		料盘轴运动输入.y轴停止:=TRUE;
	END_IF
	IF FC_误差判断(实际值:=z轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE
		AND (z轴状态.DiscreteMotion OR z轴状态.ContinuousMotion) THEN
		料盘轴运动输入.z轴停止:=TRUE;
	END_IF
END_IF


急停上升沿(CLK:= 多料盘管理输入.急停, Q=> );

IF 急停上升沿.Q THEN
	放料流程:=0;
	取料流程:=0;
	定位流程:=0;
	手动定位流程:=0;
	指定取料流程:=0;
	指定放料流程:=0;
	手动取料流程:=0;
	手动放料流程:=0;
	多料盘管理输出.料盘运动状态:=E_料盘运动状态.待机;
	料盘轴运动输入.x轴定位:=FALSE;
	料盘轴运动输入.y轴定位:=FALSE;
	料盘轴运动输入.Z轴定位:=FALSE;
	料盘轴运动输入.插补启动:=FALSE;
	多料盘管理输出.错误:=FALSE;
    多料盘管理输出.错误信息 :='';
END_IF

IF 多料盘管理输入.急停 THEN
	IF (FC_误差判断(实际值:=x轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE OR
		FC_误差判断(实际值:=y轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE) 
		AND x轴状态.SynchronizedMotion AND y轴状态.SynchronizedMotion THEN
		料盘轴运动输入.插补停止:=TRUE;
	END_IF
	IF FC_误差判断(实际值:=x轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE 
		AND (x轴状态.DiscreteMotion OR x轴状态.ContinuousMotion) THEN
		料盘轴运动输入.x轴停止:=TRUE;
	END_IF
	IF FC_误差判断(实际值:=y轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE
		AND (y轴状态.DiscreteMotion OR y轴状态.ContinuousMotion) THEN
		料盘轴运动输入.y轴停止:=TRUE;
	END_IF
	IF FC_误差判断(实际值:=z轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE
		AND (z轴状态.DiscreteMotion OR z轴状态.ContinuousMotion) THEN
		料盘轴运动输入.z轴停止:=TRUE;
	END_IF
END_IF


复位上升沿(CLK:=多料盘管理输入.复位 , Q=> );
IF  复位上升沿.Q THEN
	放料流程:=0;
	取料流程:=0;
	定位流程:=0;
	手动定位流程:=0;
	指定取料流程:=0;
	指定放料流程:=0;
	手动取料流程:=0;
	手动放料流程:=0;
	多料盘管理输出.料盘运动状态:=E_料盘运动状态.待机;
	料盘轴运动输入.x轴定位:=FALSE;
	料盘轴运动输入.y轴定位:=FALSE;
	料盘轴运动输入.Z轴定位:=FALSE;
	料盘轴运动输入.插补启动:=FALSE;
	多料盘管理输出.错误:=FALSE;
    多料盘管理输出.错误信息 :='';    
END_IF
//复位块状态,加停止轴
IF 多料盘管理输入.复位  THEN
	
	IF (FC_误差判断(实际值:=x轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE OR
		FC_误差判断(实际值:=y轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE) 
		AND x轴状态.SynchronizedMotion AND y轴状态.SynchronizedMotion THEN
		料盘轴运动输入.插补停止:=TRUE;
	END_IF
	IF FC_误差判断(实际值:=x轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE 
		AND (x轴状态.DiscreteMotion OR x轴状态.ContinuousMotion) THEN
		料盘轴运动输入.x轴停止:=TRUE;
	END_IF
	IF FC_误差判断(实际值:=y轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE
		AND (y轴状态.DiscreteMotion OR y轴状态.ContinuousMotion) THEN
		料盘轴运动输入.y轴停止:=TRUE;
	END_IF
	IF FC_误差判断(实际值:=z轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE
		AND (z轴状态.DiscreteMotion OR z轴状态.ContinuousMotion) THEN
		料盘轴运动输入.z轴停止:=TRUE;
	END_IF


ELSE
	多料盘管理输出.复位完成:=FALSE;
END_IF


// 暂停上升沿(CLK:=多料盘管理输入.暂停 , Q=> );
// IF 暂停上升沿.Q THEN
// 	
// 	
// 	IF (多料盘管理输出.料盘运动状态=E_料盘运动状态.到取料位中 OR 多料盘管理输出.料盘运动状态=E_料盘运动状态.到放料位中) 
// 	AND (取料流程>=12 OR 放料流程>=12) THEN
// 		多料盘管理输出.料盘运动状态:=E_料盘运动状态.暂停;
// 	ELSE
// 		多料盘管理输出.料盘运动状态:=E_料盘运动状态.待机;
// 	END_IF
// 	
// 	放料流程:=0;
// 	取料流程:=0;
// 	定位流程:=0;
// 	手动定位流程:=0;
// 	料盘轴运动输入.x轴定位:=FALSE;
// 	料盘轴运动输入.y轴定位:=FALSE;
// 	料盘轴运动输入.Z轴定位:=FALSE;
// 	料盘轴运动输入.插补启动:=FALSE;
// END_IF

//暂停动作
IF NOT 多料盘管理输入.暂停 THEN
	多料盘管理输出.暂停完成:=FALSE;
END_IF
IF 多料盘管理输出.暂停完成  THEN
	料盘轴运动输入.x轴定位:=FALSE;
		料盘轴运动输入.y轴定位:=FALSE;
		料盘轴运动输入.Z轴定位:=FALSE;
		料盘轴运动输入.插补启动:=FALSE;
END_IF
// IF 多料盘管理输入.暂停  THEN
// 	IF (FC_误差判断(实际值:=x轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE OR
// 		FC_误差判断(实际值:=y轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE) 
// 		AND x轴状态.SynchronizedMotion AND y轴状态.SynchronizedMotion THEN
// 		料盘轴运动输入.插补停止:=TRUE;
// 	END_IF
// 	IF FC_误差判断(实际值:=x轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE 
// 		AND (x轴状态.DiscreteMotion OR x轴状态.ContinuousMotion) THEN
// 		料盘轴运动输入.x轴停止:=TRUE;
// 	END_IF
// 	IF FC_误差判断(实际值:=y轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE
// 		AND (y轴状态.DiscreteMotion OR y轴状态.ContinuousMotion) THEN
// 		料盘轴运动输入.y轴停止:=TRUE;
// 	END_IF
// 	IF FC_误差判断(实际值:=z轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 )=FALSE
// 		AND (z轴状态.DiscreteMotion OR z轴状态.ContinuousMotion) THEN
// 		料盘轴运动输入.z轴停止:=TRUE;
// 	END_IF
// 	
// 	
// ELSE
// 	多料盘管理输出.暂停完成:=FALSE;
// END_IF

IF FC_误差判断(实际值:=x轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 ) AND
		FC_误差判断(实际值:=y轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 ) AND
		FC_误差判断(实际值:=z轴.fActVelocity , 判断值:= 0, 误差值:=0.000001 ) THEN
		料盘轴运动输入.插补停止:=FALSE;
		料盘轴运动输入.x轴停止:=FALSE;
		料盘轴运动输入.y轴停止:=FALSE;
		料盘轴运动输入.z轴停止:=FALSE;
		
		IF 多料盘管理输入.暂停 THEN
			多料盘管理输出.暂停完成:=TRUE;
		END_IF
		IF 多料盘管理输入.复位 THEN
			多料盘管理输出.复位完成:=TRUE;
		END_IF
	END_IF

	

IF NOT x轴状态.Standstill OR NOT y轴状态.Standstill OR NOT z轴状态.Standstill THEN 
	FOR i:=0 TO 4 BY 1 DO
		多料盘管理输出.定位号定位到位[i]:=FALSE;
		多料盘管理输出.到达定位位置:=FALSE;
	END_FOR
	
END_IF



多料盘管理输出.移动X轴信号:=x轴状态.DiscreteMotion OR x轴状态.ContinuousMotion;
多料盘管理输出.移动y轴信号:=y轴状态.DiscreteMotion OR y轴状态.ContinuousMotion;
多料盘管理输出.移动z轴信号:=z轴状态.DiscreteMotion OR z轴状态.ContinuousMotion;


