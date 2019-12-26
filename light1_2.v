module light1_2(clk,reset,cmd,red,yellow,green);
input clk, reset;
input [1:0] cmd;
output red,yellow,green;

reg red,yellow,green;

always@(posedge clk)
begin
if (reset)
  begin
//initialize
red =1;
yellow=0;
green=0;

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
   end
else if (cmd==1)
   begin
  //yellow
   green=0;
   yellow=1;
   red=0;
   end
else
  begin
  //green
   red=0;
   yellow=0;
   green=1;
  end

  end


end


endmodule
