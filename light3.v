module light3(clk,reset,cmd,red,yellow,green,left);
input clk, reset;
input [2:0] cmd;
output red,yellow,green,left;

reg red,yellow,green,left;

always@(posedge clk)
begin
if (reset)
  begin
//initialize
red =1;
yellow=0;
green=0;
left=0;
  end
else
  begin
//main code
if (cmd==0)
   begin
  //red
   red=1;
   yellow=0;
   green=0;
   left=0;
   end
else if (cmd==1)
   begin
  //yellow
   green=0;
   yellow=1;
   red=0;
   left=0;
   end
else if(cmd==2)
  begin
  //green
   red=0;
   yellow=0;
   green=1;
   left=0;
  end
else if(cmd==3)
  begin
   //left on
   red=0;
   yellow=0;
   green=1;
   left=1;
  
  end
else if(cmd==4)
   begin
    //left turn off
   red=0;
   yellow=1;
   green=1;
   left=0;
   end
else
  begin
  red =1;
yellow=0;
green=0;
left=0;

  end

  end


end


endmodule
