`include "ctrl_encode_def.v"
module alu (A, B, ALUOp, C,Shamt);
           
   input  signed [31:0] A, B;
   input  signed [4:0]  ALUOp;
   input  unsigned [4:0] Shamt;
   output signed [31:0] C;
   
   
   reg [31:0] C;
   integer    i;
       
   always @( A or B or ALUOp ) begin
      case (ALUOp)
          `ALUOp_NOP:  C = B;                        // NOP
		  `ALUOp_ADD:  C = A + B;                    // ADD
          `ALUOp_ADDU: C = A + B;                    // ADDU
		  `ALUOp_SUB:  C = A - B;                    // SUB
          `ALUOp_SUBU: C = A - B;                    // SUBU
          `ALUOp_AND:  C = A & B;                    // AND/ANDI
          `ALUOp_OR:   C = A | B;                    // OR/ORI
          `ALUOp_XOR:  C = A ^ B;                    // XOR/XORI
		  `ALUOp_NOR:  C = ~(A | B);                 // NOR
          `ALUOp_SLL:  C = (B << Shamt[4:0]);            // SLL/SLLV
          `ALUOp_SRL:  C = (B >> Shamt[4:0]);	           // SRL/SRLV
          `ALUOp_SLT:  C = (A < B) ? 32'd1 : 32'd0;  // SLT/SLTI
          `ALUOp_SLTU: C = ({1'b0, A} < {1'b0, B}) ? 32'd1 : 32'd0; // SLTU/SLTIU         
          `ALUOp_EQL:  C = (A == B) ? 32'd1 : 32'd0; // EQUAL
          `ALUOp_BNE:  C = (A != B) ? 32'd1 : 32'd0; // NOT EQUAL
          `ALUOp_GT0:  C = (A >  0) ? 32'd1 : 32'd0; // Great than 0
          `ALUOp_GE0:  C = (A >= 0) ? 32'd1 : 32'd0; // Great than & equal 0
          `ALUOp_LT0:  C = (A <  0) ? 32'd1 : 32'd0; // Less than 0
          `ALUOp_LE0:  C = (A <= 0) ? 32'd1 : 32'd0; // Less than & equal 0
          `ALUOp_SRA: begin                          // SRA/SRAV
		      for(i=1; i<=Shamt[4:0]; i=i+1)
			     C[32-i] = B[31];
			  for(i=31-Shamt[4:0]; i>=0; i=i-1)
			     C[i] = B[i+Shamt[4:0]];
          end                             
          default:   C = 32'd0;                	   // Undefined
      endcase
   end // end always
   

endmodule
    
