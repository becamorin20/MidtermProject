`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2018 08:15:59 PM
// Design Name: 
// Module Name: CS151_ALU
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


module CS151_ALU(
   input [31:0] operandA,
   input [31:0] operandB,
   input [3:0] ALUopsel, // not sure what the size of the array should be 
   output [31:0] ALUresult,
   output overflow,
   output equal,
   output [1:0] carry// can use a AND gate to see if there is a carry out of 1 or 0 when adding and can use notA AND B for subtracting 
   );
   reg [31:0] ALUoutput;
   wire [33:0] carry_temp;// this is a temp for the caryy out cause it is upto 2 bits that it can carry out to 
   wire [31:0] equal_temp;
   wire [31:0] temp_overflow;
   
   
   assign ALUresult = ALUoutput;
   assign carry_temp = {2'b00,operandA} + {2'b00,operandB};
   assign carry = carry_temp[33:32];
   

   
   assign equal_temp = operandA ^ operandB;
   assign equal = (equal_temp == 0) ? 1:0;
   
   assign overflow = temp_overflow;
   assign overflow = (temp_overflow[31] == 1) ? 1:0;
   
   always @(*)
   begin 
    case (ALUopsel)
    4'b0000://NOTHING 
        begin
        end 
    4'b0001: //ADD
        ALUoutput = operandA + operandB;
    4'b0010: //SUB ** rememeber if negative it is in 2's complementary
        // for subtraction I am assuming that any number with a 1 as its 
        // most significant bit is a negative number otherwise i will assume
        // it is a positive number
        //ALUoutput = operandA - operandB;
        //overflow = (ALUoutput[31] == 1) ? 1:0;
        
        begin 
        ALUoutput = operandA - operandB;
        if (ALUoutput[31] == 1) begin 
            // when the most significant bit is 1 then this is when we use 2's 
            // complement to solve for the value of the bits 
            ALUoutput = ~ALUoutput + 1; // negate the output and ADD 1 
            
            end
        
        end 
    4'b0101: //AND
        ALUoutput = operandA && operandB;
    4'b0110: // OR
        ALUoutput = operandA || operandB;
    4'b0111: // NOT
        ALUoutput = !operandA;
    4'b1000: //XOR
        ALUoutput = operandA ^ operandB;
    4'b1001: //shift left
        ALUoutput = operandA << 1; //i am assuming that it wants to shift it left once
    4'b1011: // MOV
        ALUoutput = operandA;
    endcase
  end
endmodule
