`timescale 100ms/100ms

module signal_lights_tb;
wire L1_red, L1_yellow, L1_left;
wire L2_red, L2_yellow, L2_green;
wire L3_red, L3_yellow, L3_green, L3_left;

reg clk;
reg reset;

wire [1:0] L1_cmd;
wire [1:0] L2_cmd;
wire [2:0] L3_cmd;

light1_2 L1(clk,reset,L1_cmd,L1_red,L1_yellow,L1_left);

light1_2 L2(clk,reset,L2_cmd,L2_red,L2_yellow,L2_green);

light3 L3(clk,reset,L3_cmd,L3_red,L3_yellow,L3_green,L3_left);

control c1(clk,reset,L1_cmd,L2_cmd,L3_cmd);

always
#5 clk=~clk; //1Hz

initial
begin
clk=0;
reset=0;
#2 reset=1;
#5 reset=0;
$monitor("time=%d\n L1_red=%d\n L1_yellow=%d\n L1_left=%d\n \n L2_red=%d\n L2_yellow=%d\n L2_green=%d\n \n L3_red=%d\n L3_yellow=%d\n L3_green=%d\n L3_left=%d\n",$time, L1_red,L1_yellow,L1_left,L2_red,L2_yellow,L2_green,L3_red,L3_yellow,L3_green,L3_left);
end

endmodule

