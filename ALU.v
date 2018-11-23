`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 05:39:14 PM
// Design Name: 
// Module Name: ALU
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


module ALU(ALUopsel, MUXsel ,operandA, operandB, ALUoutput, carry, overflow, equal);
    
    input ALUopsel;
    input MUXsel;
    input [31:0] operandA;
    input [31:0] operandB;
    output [31:0] ALUoutput;
    output equal, carry, overflow;

    reg [31:0] ALUoutput;
    reg equal, carry, overflow;

    //Temp regs
    reg [31:0] opB;
   
always @* begin 
    
    //Set equal flag
    equal = ((operandA ^ operandB) == 0);
    

//Case statement for ALU
   case (ALUopsel)
    4'b0000://NOTHING 
        begin
            carry = 0;
            overflow = 0;
       end
   
    4'b0001: //ADD
       begin
        {carry, ALUoutput}= operandA + operandB;
        if(operandA[31] == 0 && operandB[31] == 0) begin
            overflow = ALUoutput[31];
        end else if (operandA[31] == 1 && operandB[31] == 1) begin
            overflow = ~ALUoutput[31];
        end else begin
            overflow = 0;
        end
       end
      
    4'b0010: 
        //SUB ** rememeber if negative it is in 2's complementary
        // for subtraction I am assuming that any number with a 1 as its 
        // most significant bit is a negative number otherwise i will assume
        // it is a positive number
        //ALUoutput = operandA - operandB;
        //overflow = (ALUoutput[31] == 1) ? 1:0;
        begin
            //Converting operandB to two's complement
            opB = ~operandB;
            opB = opB +1;
            {carry, ALUoutput}= operandA + opB;
            if(operandA[31] == 0 && opB[31] == 0) begin
                overflow = ALUoutput[31];
            end else if (operandA[31] == 1 && opB[31] == 1) begin
                overflow = ~ALUoutput[31];
            end else begin
                overflow = 0;
            end   
        end
        
    4'b0101: //AND
        begin
            ALUoutput = operandA && operandB;
            carry = 0;
            overflow = (ALUoutput[31] ^ operandA[31]);
        end
        
    4'b0110: // OR
        begin
            ALUoutput = operandA || operandB;
            carry = 0;
            overflow = (ALUoutput[31] ^ operandA[31]);
        end
        
    4'b0111: // NOT
        begin
            ALUoutput = !operandA;
            carry = 0;
            overflow = (ALUoutput[31] ^ operandA[31]);
        end
        
    4'b1000: //XOR
        begin
             ALUoutput = operandA ^ operandB;
            carry = 0;
            overflow = (ALUoutput[31] ^ operandA[31]);
        end

    4'b1001: //shift left
        begin
            if(MUXsel) begin
                {carry, ALUoutput} = operandB << 1; //i am assuming that it wants to shift it left once
                overflow = (ALUoutput[31] ^ operandB[31]);
            end else begin
                {carry, ALUoutput} = operandA << 1; //i am assuming that it wants to shift it left once
                overflow = (ALUoutput[31] ^ operandA[31]);
            end
        end  
        
    4'b1011: // MOV
        begin
            if(MUXsel) begin
                ALUoutput = operandB;
            end else begin
                ALUoutput = operandA;
            end
            carry = 0;
            overflow = 0;
        end 
       
  endcase
    
  end

    
    
endmodule
