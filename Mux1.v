`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 03:54:10 PM
// Design Name: 
// Module Name: Mux1
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


module Mux1(RD2,ext_imm, operandB, MUXsel);
    
    input MUXsel;
    input [31:0] RD2;
    input [31:0] ext_imm;
    output [31:0] operandB;
    
    wire [31:0] operandB;
    
    //shortened if statement...i.e. if mux is 1 then it selects RD2 otherwise it selects ext_imm
    //If 0, select RD2 for R-type instruction
    //If 1, select ext_imm for I-type instruction
    
    assign operandB = (MUXsel) ? ext_imm : RD2;
    
    
    
    
endmodule
