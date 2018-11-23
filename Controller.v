`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 08:54:06 AM
// Design Name: 
// Module Name: Controller
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


module Controller(Inst, imm, ALUopsel, MUXsel, RegWrite, rs, rd, rt);
    
    input [31:0] Inst;
    output imm;
    output ALUopsel;
    output MUXsel;
    output RegWrite;
    output rs;
    output rd;
    output rt;
    
    reg [15:0] imm;
    reg [5:0] rt;
    reg [5:0] rs;
    reg [5:0] rd;
    
    
    reg [3:0] ALUopsel;
    reg MUXsel;
    reg RegWrite;
    
    always @*
    begin
        //imm = Inst[8:0];
        
        assign imm = {{7{Inst[8]}},Inst[8:0]};
            
       
        
        rt = Inst[14:9];
        rs = Inst[24:19];
        rd = Inst[30:25];
        
        ALUopsel = Inst[18:15]; 
        MUXsel = Inst[31];
        
        if (ALUopsel == 4'b0000) begin
            RegWrite = 0;
        end else begin
            RegWrite = 1;
        end
   end
        
        
    
    
endmodule
