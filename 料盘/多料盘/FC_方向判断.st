FUNCTION FC_方向判断 : INT
VAR_IN_OUT
	i方向X      : INT;
    i方向Y      : INT;
END_VAR
VAR_INPUT
	f起始点X     : REAL;
    f起始点Y     : REAL;
    f参考点X    : REAL;
    f参考点Y    : REAL;
END_VAR
VAR
	f间距X     : REAL;
    f间距Y     : REAL;
END_VAR

// --- BEGIN IMPLEMENTATION ---

i方向X :=0;
i方向Y :=0; 
// 参考点和起始点不能相同
IF f参考点X =f起始点X OR f参考点Y = f起始点Y THEN
	FC_方向判断 := 1;   // 参参考点和起始点不能相同
	RETURN;
END_IF;
	

// 计算实际与理论的差值
f间距X := f参考点X - f起始点X;
f间距Y := f参考点Y - f起始点Y;

// 判断X方向
i方向X := FC_SEL(f间距X > 0.0, 1, -1);


// 判断Y方向
i方向Y := FC_SEL(f间距Y > 0.0, 1, -1);