`include "ctrl_encode_def.v"
module NPC( PC, NPCOp, IMM, NPC , da);
   input  [31:2] PC;
   input  [1:0]  NPCOp;
   input  [25:0] IMM;
   input  [31:0] da;
   output [31:2] NPC;
   
   reg [31:2] NPC;
   
   always @(*) begin
      case (NPCOp)
          `NPC_PLUS4: NPC = PC + 1;
          `NPC_BRANCH: NPC = PC + {{14{IMM[15]}}, IMM[15:0]}+1;
          `NPC_JUMP: NPC = {PC[31:28], IMM[25:0]};
          `NPC_JR: NPC = da[31:2];
          default: ;
      endcase
   end // end always
   
endmodule
