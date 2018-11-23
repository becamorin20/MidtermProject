`timescale 1ns / 1ps

module instruction_memory(clk, addr, instr);

input clk;
input addr;
output instr;

wire        clk;
wire [5:0]  addr;
reg  [31:0] instr;


reg [31:0] instruction [0:63];
initial begin
//You can add in other .hex files here to test instructions written out in hex... i.e. FE040663
 $readmemh("instruction.hex", instruction);
end

always@* begin
instr = instruction[addr];
end

endmodule
