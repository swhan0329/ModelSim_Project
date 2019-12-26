module control(clk,reset,L1_cmd,L2_cmd,L3_cmd);
input clk,reset;
output [1:0] L1_cmd;
output [1:0] L2_cmd;
output [2:0] L3_cmd;

reg [1:0] L1_cmd;
reg [1:0] L2_cmd;
reg [2:0] L3_cmd;

reg [6:0] counter;
reg [2:0] state;
always@(posedge clk)
begin
  if(reset==1)
    begin
//all red
      L1_cmd=0;
      L2_cmd=0;
      L3_cmd=0;
      counter=0;
      state=0;
    end
  else
   begin
//main code
     if (state==0)
       state=1;
     else if (state==1)
       begin
       L3_cmd=3; //green and left
       L2_cmd=0; //red
       L1_cmd=0; //red   

       if(counter==39)
        begin
          counter=0;
          state=2;
        end      
       end 
    else if (state==2)
        begin
       L3_cmd=4; //green and yellow
       L2_cmd=0; //red
       L1_cmd=0; //red   

       if(counter==5)
        begin
          counter=0;
          state=3;
        end      
       end 
  else if (state==3)
        begin
       L3_cmd=2; //green
       L2_cmd=2; //green
       L1_cmd=0; //red   

       if(counter==80)
        begin
          counter=0;
          state=4;
        end      
       end 
else if (state==4)
        begin
       L3_cmd=1; //yellow
       L2_cmd=1; //yellow
       L1_cmd=0; //red   

       if(counter==5)
        begin
          counter=0;
          state=5;
        end      
       end 
else if (state==5)
        begin
       L3_cmd=0; //red
       L2_cmd=0; //red
       L1_cmd=2; //left   

       if(counter==60)
        begin
          counter=0;
          state=6;
        end   
       end 
else if (state==6)
        begin
       L3_cmd=0; //red
       L2_cmd=0; //red
       L1_cmd=1; //yellow   

       if(counter==5)
        begin
          counter=0;
          state=1;
        end   
       end 


   counter=counter+1;
   end

end

endmodule
