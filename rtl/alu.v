module ALU(
    input [3:0] A,      // 4-bit input A
    input [3:0] B,      // 4-bit input B
    input [2:0] ALUOp,  // 3-bit ALU operation selector
    output reg [3:0] Result,  // 4-bit output result
    output reg Zero     // Zero flag
);

    // Define operation codes
    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter AND_OP = 3'b010;
    parameter OR_OP = 3'b011;
    parameter XOR_OP = 3'b100;
    parameter NAND_OP = 3'b101;
    parameter NOR_OP = 3'b110;
    parameter SLT = 3'b111;   // Set on less than (signed comparison)

    always @ (A, B, ALUOp) begin
        case(ALUOp)
            ADD:    Result = A + B;                   // Addition
            SUB:    Result = A - B;                   // Subtraction
            AND_OP: Result = A & B;                   // AND
            OR_OP:  Result = A | B;                   // OR
            XOR_OP: Result = A ^ B;                   // XOR
            NAND_OP: Result = ~(A & B);               // NAND
            NOR_OP: Result = ~(A | B);                // NOR
            SLT:    Result = (A < B) ? 4'b0001 : 4'b0000;  // Set Less Than
            default: Result = 4'b0000;
        endcase

        // Set Zero flag
        Zero = (Result == 4'b0000) ? 1 : 0;
    end

endmodule
