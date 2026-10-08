TYPE S_料盘轴运动输出 :
STRUCT
	插补错误:BOOL;
	插补错误码:STRING;
	
	x定位错误:BOOL;
	x定位错误码:SM3_Error.SMC_ERROR;
	
	y定位错误:BOOL;
	y定位错误码:SM3_Error.SMC_ERROR;
	
	z定位错误:BOOL;
	z定位错误码:SM3_Error.SMC_ERROR;
END_STRUCT
END_TYPE
