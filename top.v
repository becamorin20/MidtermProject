`timescale 1ns / 1ps

module top(clk, rst, pc_out, instr, imm, ALUopsel, MUXsel, RegWrite, rs, rd, rt, ext_imm, WD, RD1, RD2, operandB, equal, carry, overflow);

input clk;
input rst;
output [5:0] pc_out;
output [31:0] instr;

output imm;
output ALUopsel;
output MUXsel;
output RegWrite;
output rs;
output rd;
output rt;

output ext_imm;

output [31:0] WD;
output [31:0] RD1; 
output [31:0] RD2; 

output [31:0] operandB;

output equal, carry, overflow;


wire clk;
wire rst;
wire [5:0] pc_out;
wire [5:0] pc_addOut;
wire [31:0] instr;

wire [15:0] imm;
wire [5:0] rt;
wire [5:0] rs;
wire [5:0] rd;  
wire [3:0] ALUopsel;
wire MUXsel;
wire RegWrite;

wire [32:0] ext_imm;

wire [31:0] WD;  
wire [31:0] RD1; 
wire [31:0] RD2; 

wire [31:0] operandB;

wire equal, carry, overflow;




instruction_memory instructionMemory(
.clk   (clk), 
.addr  (pc_out),
.instr (instr)
);

PC_Adder pcAdder(
.pc_addIn  (pc_out), 
.pc_addOut (pc_addOut)
);

ProgramCounter programCounter(
.pc_in   (pc_addOut), 
.pc_out  (pc_out), 
.rst     (rst), 
.clk     (clk)
);

Controller controller(
.Inst     (instr),
.imm      (imm), 
.ALUopsel (ALUopsel), 
.MUXsel   (MUXsel),
.RegWrite (RegWrite), 
.rs       (rs), 
.rd       (rd), 
.rt       (rt)
);

SignExtend signExtend(
.imm      (imm),
.ext_imm  (ext_imm)
);

RegFile regFile(
.RA1 (rs),
.RA2 (rt),
.WA  (rd),
.WD  (WD),
.WE1 (RegWrite),
.RD1 (RD1),
.RD2 (RD2),
.rst (rst), 
.clk (clk)

);

Mux1 mux1(
.MUXsel   (MUXsel),
.RD2      (RD2),
.ext_imm  (ext_imm),
.operandB (operandB)

);

ALU alu(
.ALUopsel (ALUopsel),
.operandA (RD2),
.operandB (operandB),
.ALUoutput (WD),
.equal (equal),
.carry (carry), 
.overflow (overflow)
);

endmodule