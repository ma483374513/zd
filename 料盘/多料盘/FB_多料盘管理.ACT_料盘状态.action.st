(* 更新料盘状态输出 *)
    FOR i := 0 TO GVL_常量.最大料盘数量 - 1 DO
        (* 检查料盘是否满料 *)
        多料盘管理输出.料盘管理输出[i].满料信号 := TRUE;  // 初始设为满料
        FOR row := 0 TO 料盘配置[i].行数 - 1 DO
            FOR col := 0 TO 料盘配置[i].列数 - 1 DO
                IF 多料盘管理数据.料盘管理数据[i].点位状态[row, col] = E_点位状态.无料 AND 
                   NOT 多料盘管理数据.料盘管理数据[i].屏蔽点位[row, col] THEN
                    多料盘管理输出.料盘管理输出[i].满料信号 := FALSE;
                END_IF;
            END_FOR;
        END_FOR;
        
        (* 检查料盘是否无料 *)
        多料盘管理输出.料盘管理输出[i].无料信号 := TRUE;  // 初始设为无料
        FOR row := 0 TO 料盘配置[i].行数 - 1 DO
            FOR col := 0 TO 料盘配置[i].列数 - 1 DO
                IF 多料盘管理数据.料盘管理数据[i].点位状态[row, col] = E_点位状态.有料 AND 
                   NOT 多料盘管理数据.料盘管理数据[i].屏蔽点位[row, col] THEN
                    多料盘管理输出.料盘管理输出[i].无料信号 := FALSE;
                END_IF;
            END_FOR;
        END_FOR;
        
        (* 输出当前点位坐标 *)
        多料盘管理输出.料盘管理输出[i].当前点位坐标.行号 := 临时定位行号;
		多料盘管理输出.料盘管理输出[i].当前点位坐标.列号 := 临时定位列号;
    END_FOR;
	
多料盘管理输出.当前X位置:=TO_REAL(x轴.fActPosition);
多料盘管理输出.当前y位置:=TO_REAL(y轴.fActPosition);
多料盘管理输出.当前z位置:=TO_REAL(z轴.fActPosition);

多料盘管理输出.当前X速度:=TO_REAL(x轴.fActVelocity);
多料盘管理输出.当前y速度:=TO_REAL(y轴.fActVelocity);
多料盘管理输出.当前z速度:=TO_REAL(z轴.fActVelocity);