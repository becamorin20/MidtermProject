`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 12:13:32 PM
// Design Name: 
// Module Name: SignExtend
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


module SignExtend(imm, ext_imm);
    
    input [15:0] imm;
    output ext_imm;
    
    reg [32:0] ext_imm;
    
    always @*
    begin
        assign ext_imm = {{16{imm[15]}},imm[15:0]};
    end
    
endmodule
