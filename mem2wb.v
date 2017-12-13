module mem2wb(clk, rst, mwreg, mm2reg, dm_dout, C_r, mrn, minstr,
  wwreg, wm2reg, mD, mC, winstr, wrn);
  input clk;
  input rst;
  input mwreg, mm2reg;
  input [31:0] C_r, dm_dout;
  input [31:0] minstr;
  input [4:0]  mrn;
  output wwreg, wm2reg;
  output [31:0] mC, mD;
  output [31:0] winstr;
  output [4:0]  wrn;
  reg wwreg, wm2reg;
  reg [31:0] mC, mD;
  reg [31:0] winstr;
  reg [4:0]  wrn;
  
  always @ (posedge clk or posedge rst) begin
    if(rst) begin
      wwreg <= 0;
      wm2reg <= 0;
      mC <= 0;
      mD <= 0;
      winstr <= 0;
      wrn <= 0;
    end
  else begin
      wwreg <= mwreg;
      wm2reg <= mm2reg;
      mC <= C_r;
      mD <= dm_dout;
      winstr <= minstr;
      wrn <= mrn;
    end
  end
endmodule
