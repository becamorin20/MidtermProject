`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2018 01:04:52 PM
// Design Name: 
// Module Name: ALU_RegFile
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


module ALU_RegFile(
    input [5:0] RA1, //rs,
    input [5:0] RA2,//rt, 
    input [5:0] WA, //rd,
    input [31:0] WD, //ALUresult,
    input WE1,//RegWrite,
    input clk, 
    
    output [31:0] RD1,//OperandA,
    output [31:0] RD2//OperandB,
    );
    
    reg RD1;
    reg RD2;
    
    reg [31:0] Reg[0:64]; // 64 32-bit registers inside the register file 
    
    always @ (*) begin
        case (RA1)
            // not sure if the case has to be in binary or if it is okay if it is in decimal
            0:RD1 = Reg[0];//000000:RD1 = Reg[0];
            1:RD1 = Reg[1];
            2:RD1 = Reg[2];
            3:RD1 = Reg[3];
            4:RD1 = Reg[4];
            5:RD1 = Reg[5];
            6:RD1 = Reg[6];
            7:RD1 = Reg[7];
            8:RD1 = Reg[8];
            9:RD1 = Reg[9];
            10:RD1 = Reg[10];
            11:RD1 = Reg[11];
            12:RD1 = Reg[12];
            13:RD1 = Reg[13];
            14:RD1 = Reg[14];
            15:RD1 = Reg[15];
            16:RD1 = Reg[16];
            17:RD1 = Reg[17];
            18:RD1 = Reg[18];
            19:RD1 = Reg[19];
            20:RD1 = Reg[20];
            21:RD1 = Reg[21];
            22:RD1 = Reg[22];
            23:RD1 = Reg[23];
            24:RD1 = Reg[24];
            25:RD1 = Reg[25];
            26:RD1 = Reg[26];
            27:RD1 = Reg[27];
            28:RD1 = Reg[28];
            29:RD1 = Reg[29];
            30:RD1 = Reg[30];
            31:RD1 = Reg[31];
            32:RD1 = Reg[32];
            33:RD1 = Reg[33];
            34:RD1 = Reg[34];
            35:RD1 = Reg[35];
            36:RD1 = Reg[36];
            37:RD1 = Reg[37];
            38:RD1 = Reg[38];
            39:RD1 = Reg[39];
            40:RD1 = Reg[40];
            41:RD1 = Reg[41];
            42:RD1 = Reg[42];
            43:RD1 = Reg[43];
            44:RD1 = Reg[44];
            45:RD1 = Reg[45];
            46:RD1 = Reg[46];
            47:RD1 = Reg[47];
            48:RD1 = Reg[48];
            49:RD1 = Reg[49];
            50:RD1 = Reg[50];
            51:RD1 = Reg[51];
            52:RD1 = Reg[52];
            53:RD1 = Reg[53];
            54:RD1 = Reg[54];
            55:RD1 = Reg[55];
            56:RD1 = Reg[56];
            57:RD1 = Reg[57];
            58:RD1 = Reg[58];
            59:RD1 = Reg[59];
            60:RD1 = Reg[60];
            61:RD1 = Reg[61];
            62:RD1 = Reg[62];
            63:RD1 = Reg[63]; 
            default:RD1 = 32'b00000000000000000000000000000000;// basically to make it empty
         endcase 
    end 
    
    always @ (*) begin
            case (RA2)
                // not sure if the case has to be in binary or if it is okay if it is in decimal
                0:RD2 = Reg[0];//000000:RD2 = Reg[0];
                1:RD2 = Reg[1];
                2:RD2 = Reg[2];
                3:RD2 = Reg[3];
                4:RD2 = Reg[4];
                5:RD2 = Reg[5];
                6:RD2 = Reg[6];
                7:RD2 = Reg[7];
                8:RD2 = Reg[8];
                9:RD2 = Reg[9];
                10:RD2 = Reg[10];
                11:RD2 = Reg[11];
                12:RD2 = Reg[12];
                13:RD2 = Reg[13];
                14:RD2 = Reg[14];
                15:RD2 = Reg[15];
                16:RD2 = Reg[16];
                17:RD2 = Reg[17];
                18:RD2 = Reg[18];
                19:RD2 = Reg[19];
                20:RD2 = Reg[20];
                21:RD2 = Reg[21];
                22:RD2 = Reg[22];
                23:RD2 = Reg[23];
                24:RD2 = Reg[24];
                25:RD2 = Reg[25];
                26:RD2 = Reg[26];
                27:RD2 = Reg[27];
                28:RD2 = Reg[28];
                29:RD2 = Reg[29];
                30:RD2 = Reg[30];
                31:RD2 = Reg[31];
                32:RD2 = Reg[32];
                33:RD2 = Reg[33];
                34:RD2 = Reg[34];
                35:RD2 = Reg[35];
                36:RD2 = Reg[36];
                37:RD2 = Reg[37];
                38:RD2 = Reg[38];
                39:RD2 = Reg[39];
                40:RD2 = Reg[40];
                41:RD2 = Reg[41];
                42:RD2 = Reg[42];
                43:RD2 = Reg[43];
                44:RD2 = Reg[44];
                45:RD2 = Reg[45];
                46:RD2 = Reg[46];
                47:RD2 = Reg[47];
                48:RD2 = Reg[48];
                49:RD2 = Reg[49];
                50:RD2 = Reg[50];
                51:RD2 = Reg[51];
                52:RD2 = Reg[52];
                53:RD2 = Reg[53];
                54:RD2 = Reg[54];
                55:RD2 = Reg[55];
                56:RD2 = Reg[56];
                57:RD2 = Reg[57];
                58:RD2 = Reg[58];
                59:RD2 = Reg[59];
                60:RD2 = Reg[60];
                61:RD2 = Reg[61];
                62:RD2 = Reg[62];
                63:RD2 = Reg[63]; 
                default:RD2 = 32'b00000000000000000000000000000000;// basically to make it empty
             endcase 
        end 
    
    
    
    
    
    
endmodule


