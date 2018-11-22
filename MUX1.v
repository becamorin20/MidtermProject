`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2018 02:14:40 PM
// Design Name: 
// Module Name: MUX1
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


module MUX1(
    input MUXsel1,
    input [31:0] Din_0,
    input [31:0] Din_1,
    output [31:0] OperandB
    );
    
    wire [31:0] OperandB;
    assign OperandB = (MUXsel1 == 0) ? Din_0 : Din_1;
endmodule
