module ALU_tb;

  reg [3:0] A, B;
  reg [2:0] ALUOp;
  wire [3:0] Result;
  wire Zero;

  ALU uut (
    .A(A),
    .B(B),
    .ALUOp(ALUOp),
    .Result(Result),
    .Zero(Zero)
  );

  initial begin
    // Display header
    $display("Time | ALUOp |  A  |  B  | Result | Zero");
    $display("-----+--------+-----+-----+--------+------");
    $monitor("%4t |  %b   | %b | %b |  %b   |  %b", 
              $time, ALUOp, A, B, Result, Zero);

    // Test ADD
    A = 4'b0011; B = 4'b0001; ALUOp = 3'b000; #10;

    // Test SUB
    A = 4'b0100; B = 4'b0011; ALUOp = 3'b001; #10;

    // Test AND
    A = 4'b1100; B = 4'b1010; ALUOp = 3'b010; #10;

    // Test OR
    A = 4'b1100; B = 4'b1010; ALUOp = 3'b011; #10;

    // Test XOR
    A = 4'b1100; B = 4'b1010; ALUOp = 3'b100; #10;

    // Test NAND
    A = 4'b1100; B = 4'b1010; ALUOp = 3'b101; #10;

    // Test NOR
    A = 4'b1100; B = 4'b1010; ALUOp = 3'b110; #10;

    // Test SLT: A < B
    A = 4'b0010; B = 4'b0100; ALUOp = 3'b111; #10;

    // Test SLT: A > B
    A = 4'b0101; B = 4'b0011; ALUOp = 3'b111; #10;

    // Test Zero flag: result should be zero
    A = 4'b0101; B = 4'b0101; ALUOp = 3'b001; #10; // SUB: A - B = 0

    // Finish simulation
    $finish;
  end

endmodule
