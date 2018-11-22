`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2018 03:18:11 PM
// Design Name: 
// Module Name: PC_Adder
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


module PC_Adder(pc_addIn, pc_addOut);
    input pc_addIn;
    output pc_addOut;
    
    wire [5:0] pc_addIn;
    reg  [5:0] pc_addOut;
    
    always@*
    begin
        pc_addOut = pc_addIn + 6'b000001;
    end
    
endmodule
