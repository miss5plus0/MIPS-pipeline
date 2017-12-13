module exe2mem(clk, rst, ewreg, em2reg, ewmem, einstr, C, eb, ern,
  mwreg, mm2reg, mwmem, C_r, minstr, mb, mrn);
  input clk;
  input rst;
  input ewreg, em2reg, ewmem;
  input [31:0] C, eb;
  input [31:0] einstr;
  input [4:0]  ern;
  output mwreg, mm2reg, mwmem;
  output [31:0] C_r, mb;
  output [31:0] minstr;
  output [4:0]  mrn;
  reg mwreg, mm2reg, mwmem;
  reg [31:0] C_r, mb;
  reg [31:0] minstr;
  reg [4:0]  mrn;
  
  always @ (posedge clk or posedge rst) begin
    if( rst ) begin
      mwreg <= 0;
      mm2reg <= 0;
      mwmem <= 0;
      minstr <= 0;
      C_r <= 0;
      mb <= 0;
      mrn <= 0;
    end
  else begin
      mwreg <= ewreg;
      mm2reg <= em2reg;
      mwmem <= ewmem;
      minstr <= einstr;
      C_r <= C;
      mb <= eb;
      mrn <= ern;
    end
  end
endmodule
  
  
  
