IF SafetyRelayAlarm = TRUE AND StackLightEnable = FALSE THEN
    
    CASE count OF
	0: //init
		count := count + 1;

	1: // Red
   
		RedLight := True;
		YellowLight := False;
     	GreenLight := False;
     
		wait(IN:=TRUE, PT:=T#3s);
		
		IF wait.Q THEN
			wait(IN:=FALSE);
			count := count + 1;
		END_IF;

  	 2: // Red and Amber
   		
   		RedLight := True;
    	YellowLight := True;
    	GreenLight := False;
     
     	wait(IN:=TRUE, PT:=T#3s);
	
		IF wait.Q THEN
			wait(IN:=FALSE);
			count := count + 1;
		END_IF;

   	3:  // Green

		RedLight := False;
		YellowLight := False;
		GreenLight := True;
     
     	wait(IN:=TRUE, PT:=T#3s);
     		
     	IF wait.Q THEN
     		wait(IN:=FALSE);
     		count := count + 1;
     	END_IF;
      
  	 4: // Amber
   
   		RedLight 	:= False;
   		YellowLight := True;
   		GreenLight := False;
   		
   		wait(IN:=TRUE, PT:=T#3s);
   		
   		IF wait.Q THEN
   			wait(IN:=FALSE);
   			count := count + 1;
   		END_IF;
   		
		ELSE
		count := 0;

    END_CASE;
    
ELSE

    RedLight := FALSE;
	YellowLight := FALSE;
    GreenLight := FALSE;
    
END_IF




