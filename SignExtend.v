`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2018 02:30:19 PM
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


module SignExtend(
    input [14:0] imm,
    output [31:0] ext_imm
    );
    
    //wire [14:0] temp_imm;
    reg [31:0] ext_out;
    
    assign ext_imm = ext_out;
    
    always @ (imm) begin 
    if (imm[14] == 1'b1)begin
        ext_out = {17'b11111111111111111, imm};
        end 
    else begin
        ext_out = {17'b00000000000000000, imm};
        end 
    end
    
endmodule
