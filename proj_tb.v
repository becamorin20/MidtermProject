
module proj_tb;
// Declare inputs as regs and outputs as wires
reg clk, rst, enable;
wire [5:0]  pc_out;
wire [31:0] instr;

wire [15:0] imm;
wire [5:0] rt;
wire [5:0] rs;
wire [5:0] rd;  
wire [3:0] ALUopsel;
wire MUXsel;
wire RegWrite;

wire [31:0] ext_imm;
   
wire [31:0] WD;  
wire [31:0] RD1; 
wire [31:0] RD2; 

wire [31:0] operandB;

wire equal, carry, overflow;

// Initialize all variables
initial begin        
  $display ("time\t clk rst enable pc_out");	
  $monitor ("%g\t %b   %b     %b      %b", 
	  $time, clk, rst, enable, pc_out);	
  clk = 1;       // initial value of clock
  rst = 0;       // initial value of reset
  enable = 0;      // initial value of enable
  #5 rst = 1;    // Assert the reset
  #10 rst = 0;   // De-assert the reset
  #10 enable = 1;  // Assert enable
  #10000 enable = 0; // De-assert enable
  #5 $finish;      // Terminate simulation
end

// Clock generator
always begin
  #1 clk = ~clk; // Toggle clock every 5 ticks
end

// Connect DUT to test bench
top  Top (

.clk     (clk),
.rst     (rst),
.pc_out  (pc_out),
.instr   (instr),

.imm      (imm),
.ALUopsel (ALUopsel), 
.MUXsel   (MUXsel),
.RegWrite (RegWrite), 
.rs       (rs), 
.rd       (rd), 
.rt       (rt),


.ext_imm  (ext_imm),

.WD  (WD),
.RD1 (RD1),
.RD2 (RD2),

.operandB (operandB),

.equal (equal),
.carry (carry), 
.overflow (overflow)

);


endmodule
