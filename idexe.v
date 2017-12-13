module idexe (clk, rst, wreg, m2reg, wmem, jal, aluc, aluimm, shamt, dpc4, da, db, Imm32, drn, instr,
  ewreg, em2reg, ewmem, ejal, ealuc, ealuimm, eshamt, einstr, epc4, ea, eb, eimm, ern);
  input         clk;
  input         rst;
  input [31:0] da, db, Imm32, instr;
  input [31:2] dpc4;
  input [4:0]  shamt, drn, aluc;
  input        wreg, m2reg, wmem, jal, aluimm ;
  output [31:0] ea, eb, eimm, einstr;
  output [31:2] epc4;
  output [4:0]  eshamt, ern, ealuc;
  output        ewreg, em2reg, ewmem, ejal, ealuimm;
  reg [31:0] ea, eb, eimm, einstr;
  reg [31:2] epc4;
  reg [4:0]  eshamt, ern, ealuc;
  reg        ewreg, em2reg, ewmem, ejal, ealuimm;
  
  always @ (posedge clk or posedge rst) begin
    if (rst) begin
    ea <= 0;
    eb <= 0;
    eimm <= 0;
    einstr <= 0;
    epc4 <= 0;
    eshamt <= 0;
    ern <= 0;
    ealuc <= 0;
    ewreg <= 0;
    em2reg <= 0;
    ewmem <= 0;
    ejal <= 0;
    ealuimm <= 0;
  end
else begin
    ea <= da;
    eb <= db;
    eimm <= Imm32;
    einstr <= instr;
    epc4 <= dpc4;
    eshamt <= shamt;
    ern <= drn;
    ealuc <= aluc;
    ewreg <= wreg;
    em2reg <= m2reg;
    ewmem <= wmem;
    ejal <= jal;
    ealuimm <= aluimm;
  end
end
endmodule
     
