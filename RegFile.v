`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 01:06:26 PM
// Design Name: 
// Module Name: RegFile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RegFile(RA1, RA2, WA, WD, WE1, RD1, RD2, clk, rst);

input [5:0] RA1;  //rs
input [5:0] RA2;  //rt
input [5:0] WA;   //rd

input [31:0] WD;  //output from ALU
 
input WE1;  //write enable from controller

output [31:0] RD1; //operandA
output [31:0] RD2; //operandB through mux if chosen

input clk;
input rst;

reg [31:0] regs[0:63];

integer i;
integer j;


//initlaize register file to 0
initial begin
    for (i = 0; i<64; i=i+1) begin
       regs[i] <= 0;
    end
end

//read is not clocked so assign values from read address to read data
//assign RD1 = regs[RA1];
//assign RD2 = regs[RA2];

assign RD1 = (RA1==0) ? 32'b0 : regs[RA1];
assign RD2 = (RA2==0) ? 32'b0 : regs[RA2];

//write is clocked...can only write on a rising clock edge
always @(posedge clk) begin
    if(rst) begin
        //initialize register file to 0..i.e. every register gets initialized to 0
        for(j = 0; j<64; j = j+1) begin
            regs[j] <= 32'b0;
        end
    end else begin
        //otherwise if write enable is one, write data to register
        if(WE1) begin 
            regs[WA] <= WD;
        end 

    end
end

endmodule
