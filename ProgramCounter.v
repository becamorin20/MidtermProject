`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2018 05:34:46 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(pc_in, pc_out, rst, clk);

    input  pc_in;
    input  clk;
    input  rst;
    output pc_out;
    
    wire [5:0] pc_in;
    wire       clk;
    wire       rst;
    reg [5:0]  pc_out;
     
    initial begin
        pc_out <= 6'b000000;
    end
    
    always @(posedge clk)
    begin
        if(rst == 1) begin
            pc_out <= 6'b000000;
        end else begin
            pc_out <= pc_in;
        end       
    end

           
    
   
endmodule
