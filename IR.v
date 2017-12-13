module IR (clk, rst, IRWr, im_dout, instr, PC, PC4);       
   input         clk;
   input         rst;
   input         IRWr; 
   input  [31:2] PC;
   input  [31:0] im_dout;
   output [31:0] instr;
   output [31:2] PC4;
   reg [31:0]    instr;
   reg    [31:2] PC4; 
   initial begin   //???instr
   instr = 0;
   end        
   always @(posedge clk or im_dout) begin
     if (IRWr) begin     //??????im_dout??????????????6ns????????PC?
     #6    instr <= im_dout;  //????????branch?j??????????
           PC4 <= PC+1;
    end
   end // end always 
endmodule
