FUNCTION_BLOCK FB_多料盘管理
VAR_IN_OUT
	x轴:SM3_Basic.AXIS_REF_VIRTUAL_SM3;
	y轴:SM3_Basic.AXIS_REF_VIRTUAL_SM3;
	z轴:SM3_Basic.AXIS_REF_VIRTUAL_SM3;
	
	
	多料盘管理数据:S_多料盘管理数据;
	多料盘管理输出:S_多料盘管理输出;
	ST_料盘配置V1_xg_0:ARRAY[0..gvl_常量.最大料盘数量-1] OF ST_料盘配置V1_xg;
	
END_VAR
VAR_INPUT
	全局状态:E_系统运行状态;
	使能:BOOL;
	多料盘管理输入HMI:S_多料盘管理输入HMI;
	S_多料盘管理输入HMI_xg_V1_0:S_多料盘管理输入HMI_xg_V1;
	多料盘管理输入	:S_多料盘管理输入;
	
	x轴配置:Ax_配置;
	y轴配置:Ax_配置;
	z轴配置:Ax_配置;
	x轴输出:Basic_Lib.Ax_输出;
	y轴输出:Basic_Lib.Ax_输出;
	z轴输出:Basic_Lib.Ax_输出;
	
	多料盘管理配置:S_多料盘管理配置;
	料盘配置	:ARRAY[0..gvl_常量.最大料盘数量-1] OF S_料盘配置;
	料盘工艺配置	:ARRAY[0..gvl_常量.最大料盘数量-1] OF S_料盘工艺配置;
	多料盘工艺配置	: S_多料盘工艺配置;
	//料盘轴运动输出:S_料盘轴运动输出;
END_VAR
VAR_OUTPUT
	料盘轴运动输入:S_料盘轴运动输入;
	料盘轴运动输出:S_料盘轴运动输出;
	报错料盘:INT;
END_VAR
VAR
	CheckID:Basic_Lib.FB_CheckID;
	//FB_G代码插补_0:FB_G代码插补;
	MC_MoveAbsolute_0: MC_MoveAbsolute;
	MC_MoveAbsolute_1: MC_MoveAbsolute;
	MC_MoveAbsolute_2: MC_MoveAbsolute;
	MC_Move_ChangePosVel_Pul_2: Basic_Lib.MC_Move_ChangePosVel_Pul;
	MC_Stop_1: MC_Stop;
	MC_Stop_2: MC_Stop;
	MC_Stop_3: MC_Stop;
	MC_Reset_0:MC_Reset;
	MC_Reset_1:MC_Reset;
	MC_Reset_2:MC_Reset;
	
	x轴状态:MC_ReadStatus;
	y轴状态:MC_ReadStatus;
	z轴状态:MC_ReadStatus;
	SMC3_ReinitDrive_0:SMC3_ReinitDrive;
	SMC3_ReinitDrive_1:SMC3_ReinitDrive;
	SMC3_ReinitDrive_2:SMC3_ReinitDrive;
	
	清空多料盘管理输出:S_多料盘管理输出;

	使能上升沿:R_TRIG;
	设置料盘满料上升沿 :  R_TRIG;  // 设置料盘满料上升沿
	设置料盘空料上升沿 :  R_TRIG;  // 设置料盘空料上升沿
	急停上升沿:  R_TRIG;
	
	取料上升沿 :  R_TRIG;  // 设置料盘满料上升沿
	放料上升沿 :  R_TRIG;  // 设置料盘空料上升沿
	定位上升沿 :  Standard.R_TRIG;
	到初始位上升沿:Standard.R_TRIG;
	
	取料完成上升沿 :  R_TRIG;
	放料完成上升沿 :  R_TRIG;
	错误上升沿:R_TRIG;
	
	手动设置点位状态上升沿:  R_TRIG;
	手动定位点位上升沿:  R_TRIG;
	手动急停上升沿:  R_TRIG;
	手动定位上升沿 :  Standard.R_TRIG;
	
	手动指定取料上升沿:  R_TRIG;
	手动指定放料上升沿:  R_TRIG;
	手动取料上升沿:  R_TRIG;
	手动放料上升沿:  R_TRIG;
	
	暂停上升沿:  R_TRIG;
	复位上升沿:  R_TRIG;
	
	i: INT;
	row: INT;
	col: INT;
	取料流程: INT;
	j: INT;
	临时定位行号: INT;
	临时定位列号: INT;
	
	z轴定位到位:BOOL;
	放料流程: INT;
	手动定位流程: INT;
	插补定位完成: BOOL;

	定位流程: INT;
	手动定位流程1: INT;
	
	手动x目标位置:REAL;
	手动y目标位置:REAL;
	手动z目标位置:REAL;
	
	指定x目标位置:REAL;
	指定y目标位置:REAL;
	指定z目标位置:REAL;
	
	z轴在待料位:BOOL;
	
	x轴定位到位: BOOL;
	y轴定位到位: BOOL;
	流程运行状态: BOOL;
	动作控制变量状态: BOOL;
	流程可运行: BOOL;
	轴可运动: BOOL;
	料盘管理输入: INT;
	暂停取料流程: INT;
	暂停定位流程: INT;
	错误前取料流程: INT;
	错误前放料流程: INT;
	错误前定位流程: INT;
	
	
	x取料方向X:INT;
	x取料方向Y:INT;
	x放料方向X:INT;
	x放料方向Y:INT;
	
	i行起始:INT;
	i行结束:INT;
	i列起始:INT;
	i列结束:INT;
	i行递增:INT;
	i列递增:INT;
	指定取料流程: INT;
	指定放料流程: INT;
	手动料盘选择:INT;
	手动取料流程: INT;
	手动放料流程: INT;
END_VAR

// --- BEGIN IMPLEMENTATION ---

(*========================输入控制========================*)
CheckID(xID检测:= TRUE, xID正确=> );
//IF NOT CheckID.xID正确 THEN RETURN; END_IF

IF ADR(x轴) = SM3_Basic.NULL THEN
    RETURN;
END_IF
IF ADR(y轴) = SM3_Basic.NULL  THEN
    RETURN;
END_IF
IF ADR(z轴) = SM3_Basic.NULL  THEN
    RETURN;
END_IF



使能上升沿(CLK:=使能 , Q=> );
IF NOT 使能 THEN
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
	多料盘管理输出.错误信息:='';
	RETURN;
ELSE
	;
END_IF


ACT_自动状态控制();




设置料盘满料上升沿(CLK := (多料盘管理输入.设置料盘为满料  AND 多料盘管理输入.手自动) OR (多料盘管理输入HMI.设置料盘为满料  AND NOT 多料盘管理输入.手自动));
设置料盘空料上升沿(CLK := (多料盘管理输入.设置料盘为空料 AND 多料盘管理输入.手自动) OR (多料盘管理输入HMI.设置料盘为空料  AND NOT 多料盘管理输入.手自动));
(* 处理料盘设置满料信号 *)
IF 设置料盘满料上升沿.Q THEN
	(* 初始化指定料盘数据 *)
	FOR row := 0 TO GVL_常量.最大料盘行数 - 1 DO
		FOR col := 0 TO GVL_常量.最大料盘列数 - 1 DO
			IF 多料盘管理输入.料盘选择<=GVL_常量.最大料盘数量-1 THEN
				IF  多料盘管理输入.手自动 THEN
					多料盘管理数据.料盘管理数据[多料盘管理输入.料盘选择].点位状态[row, col] := E_点位状态.有料;
					多料盘管理数据.料盘管理数据[多料盘管理输入.料盘选择].屏蔽点位[row, col] := FALSE;
				ELSE
					多料盘管理数据.料盘管理数据[多料盘管理输入HMI.料盘选择].点位状态[row, col] := E_点位状态.有料;
					多料盘管理数据.料盘管理数据[多料盘管理输入HMI.料盘选择].屏蔽点位[row, col] := FALSE;
				END_IF
			
			END_IF
			
			
		END_FOR;
	END_FOR;
	IF 多料盘管理输入.料盘选择>GVL_常量.最大料盘数量-1 THEN
	FOR i := 0 TO GVL_常量.最大料盘数量 - 1 DO
		FOR row := 0 TO GVL_常量.最大料盘行数 - 1 DO
			FOR col := 0 TO GVL_常量.最大料盘列数 - 1 DO
				
				多料盘管理数据.料盘管理数据[i].点位状态[row, col] := E_点位状态.有料;
				多料盘管理数据.料盘管理数据[i].屏蔽点位[row, col] := FALSE;
			
			END_FOR;
		END_FOR;
	END_FOR
	END_IF
END_IF;

(* 处理料盘设置空料信号 *)
IF 设置料盘空料上升沿.Q THEN
	(* 初始化指定料盘数据 *)
	FOR row := 0 TO GVL_常量.最大料盘行数 - 1 DO
		FOR col := 0 TO GVL_常量.最大料盘列数 - 1 DO
			IF 多料盘管理输入.料盘选择<=GVL_常量.最大料盘数量-1 THEN
				IF  多料盘管理输入.手自动 THEN
					多料盘管理数据.料盘管理数据[多料盘管理输入.料盘选择].点位状态[row, col] := E_点位状态.无料;
					多料盘管理数据.料盘管理数据[多料盘管理输入.料盘选择].屏蔽点位[row, col] := FALSE;
				ELSE
					多料盘管理数据.料盘管理数据[多料盘管理输入HMI.料盘选择].点位状态[row, col] := E_点位状态.无料;
					多料盘管理数据.料盘管理数据[多料盘管理输入HMI.料盘选择].屏蔽点位[row, col] := FALSE;
				END_IF
			END_IF
		END_FOR;
		
		IF 多料盘管理输入.料盘选择>GVL_常量.最大料盘数量-1 THEN
		FOR i := 0 TO GVL_常量.最大料盘数量 - 1 DO
			FOR row := 0 TO GVL_常量.最大料盘行数 - 1 DO
				FOR col := 0 TO GVL_常量.最大料盘列数 - 1 DO
					
					多料盘管理数据.料盘管理数据[i].点位状态[row, col] := E_点位状态.无料;
					多料盘管理数据.料盘管理数据[i].屏蔽点位[row, col] := FALSE;
				
				END_FOR;
			END_FOR;
		END_FOR
		END_IF
	END_FOR;
END_IF;
	
手动设置点位状态上升沿(CLK:=多料盘管理输入HMI.设置点位状态信号 , Q=> );
IF 手动设置点位状态上升沿.Q AND ((多料盘管理输入HMI.目标点位.行号<>临时定位行号 OR 多料盘管理输入HMI.目标点位.列号<>临时定位列号)OR (放料流程=0 AND 取料流程=0))  THEN
	多料盘管理数据.料盘管理数据[多料盘管理输入HMI.料盘选择].点位状态[多料盘管理输入HMI.目标点位.行号,多料盘管理输入HMI.目标点位.列号]:=多料盘管理输入HMI.设置状态;
	多料盘管理数据.料盘管理数据[多料盘管理输入HMI.料盘选择].屏蔽点位[多料盘管理输入HMI.目标点位.行号,多料盘管理输入HMI.目标点位.列号]:=(多料盘管理输入HMI.设置状态=E_点位状态.屏蔽);
END_IF


流程可运行:=放料流程=0 AND 取料流程=0 AND 定位流程=0 AND 手动定位流程=0 AND 指定取料流程=0 AND 指定放料流程=0 AND 手动取料流程=0 AND 手动放料流程=0 ;

轴可运动:= x轴状态.Standstill AND y轴状态.Standstill AND z轴状态.Standstill ;
//x轴输出.x回零完成 AND y轴输出.x回零完成 AND z轴输出.x回零完成  AND


ACT_手动();
ACT_手动指定放料();
ACT_手动指定取料();
ACT_手动放料();
ACT_手动取料();
ACT_自动取料();
ACT_自动放料();
ACT_定位号插补();







ACT_FB();






多料盘管理输出.初始位定位到位:=(x轴.fActPosition<=(多料盘管理配置.x轴待料位+x轴配置.f到位偏差)) AND (x轴.fActPosition>=(多料盘管理配置.x轴待料位-x轴配置.f到位偏差)) 
	AND(y轴.fActPosition<=(多料盘管理配置.y轴待料位+y轴配置.f到位偏差)) AND (y轴.fActPosition>=(多料盘管理配置.y轴待料位-y轴配置.f到位偏差))
	AND (z轴.fActPosition<=(多料盘管理配置.z轴待料位+z轴配置.f到位偏差)) AND (z轴.fActPosition>=(多料盘管理配置.z轴待料位-z轴配置.f到位偏差)
	AND  x轴状态.Standstill AND y轴状态.Standstill AND z轴状态.Standstill );
	
插补定位完成:=((x轴.fActPosition<=(料盘轴运动输入.目标位置[0]+x轴配置.f到位偏差)) AND (x轴.fActPosition>=(料盘轴运动输入.目标位置[0]-x轴配置.f到位偏差)) 
AND(y轴.fActPosition<=(料盘轴运动输入.目标位置[1]+y轴配置.f到位偏差)) AND (y轴.fActPosition>=(料盘轴运动输入.目标位置[1]-y轴配置.f到位偏差)));

x轴定位到位:=((x轴.fActPosition<=(料盘轴运动输入.x定位位置+x轴配置.f到位偏差)) AND (x轴.fActPosition>=(料盘轴运动输入.x定位位置-x轴配置.f到位偏差)));
y轴定位到位:=((y轴.fActPosition<=(料盘轴运动输入.y定位位置+y轴配置.f到位偏差)) AND (y轴.fActPosition>=(料盘轴运动输入.y定位位置-y轴配置.f到位偏差)));
z轴定位到位:=((z轴.fActPosition<=(料盘轴运动输入.z定位位置+z轴配置.f到位偏差)) AND (z轴.fActPosition>=(料盘轴运动输入.z定位位置-z轴配置.f到位偏差)));



z轴在待料位:=(z轴.fActPosition<=(多料盘管理配置.z轴待料位+z轴配置.f到位偏差)) AND (z轴.fActPosition>=(多料盘管理配置.z轴待料位-z轴配置.f到位偏差));


ACT_料盘状态();


//手自动报警清除
IF 多料盘管理输入.报警清除 OR 多料盘管理输入hmi.报警清除 THEN
	多料盘管理输出.错误:=FALSE;
    多料盘管理输出.错误信息 :='';              // 系统错误描述
	//多料盘管理输出.料盘运动状态:=E_料盘运动状态.待机;
END_IF

IF 料盘轴运动输出.x定位错误 THEN 多料盘管理输出.错误:=TRUE; 多料盘管理输出.错误信息 := Standard.CONCAT('SMC_ERROR: ', TO_STRING(料盘轴运动输出.x定位错误码));多料盘管理输出.错误代码:=E_错误码.料盘X轴定位错误; END_IF
IF 料盘轴运动输出.y定位错误 THEN 多料盘管理输出.错误:=TRUE; 多料盘管理输出.错误信息 := Standard.CONCAT('SMC_ERROR: ', TO_STRING(料盘轴运动输出.y定位错误码));多料盘管理输出.错误代码:=E_错误码.料盘Y轴定位错误; END_IF
IF 料盘轴运动输出.z定位错误 THEN 多料盘管理输出.错误:=TRUE; 多料盘管理输出.错误信息 :=MC_Move_ChangePosVel_Pul_2.s错误码; (*Standard.CONCAT('SMC_ERROR: ', TO_STRING(料盘轴运动输出.z定位错误码));*)多料盘管理输出.错误代码:=E_错误码.料盘Z轴定位错误; END_IF
//IF LS_2AxisLine_1.Error  THEN 多料盘管理输出.错误:=TRUE; 多料盘管理输出.错误信息 := Standard.CONCAT('SMC_ERROR: ', TO_STRING(LS_2AxisLine_1.ErrorID)); 多料盘管理输出.错误代码:=3; END_IF
//IF 料盘轴运动输出.插补错误 THEN 多料盘管理输出.错误:=TRUE; 多料盘管理输出.错误信息 := 料盘轴运动输出.插补错误码;多料盘管理输出.错误代码:=3; END_IF


错误上升沿(CLK:= 多料盘管理输出.错误, Q=> );
IF 错误上升沿.Q THEN
	;
	放料流程:=0;
	取料流程:=0;
	定位流程:=0;
	手动定位流程:=0;
	指定取料流程:=0;
	指定放料流程:=0;
	手动取料流程:=0;
	手动放料流程:=0;
	料盘轴运动输入.x轴定位:=FALSE;
	料盘轴运动输入.y轴定位:=FALSE;
	料盘轴运动输入.Z轴定位:=FALSE;
	料盘轴运动输入.插补启动:=FALSE;
	多料盘管理输出.料盘运动状态:=E_料盘运动状态.错误;
END_IF

IF 多料盘管理输出.错误 THEN
	;
	放料流程:=0;
	取料流程:=0;
	定位流程:=0;
	手动定位流程:=0;
	指定取料流程:=0;
	手动取料流程:=0;
	手动放料流程:=0;
	料盘轴运动输入.x轴定位:=FALSE;
	料盘轴运动输入.y轴定位:=FALSE;
	料盘轴运动输入.Z轴定位:=FALSE;
	料盘轴运动输入.插补启动:=FALSE;
END_IF