//==========================================================
// Simple 8‑operation ALU
//==========================================================
module alu_simple
#(parameter WIDTH = 32)              // data‑path width
(
    input  wire [WIDTH-1:0] A,       // operand A
    input  wire [WIDTH-1:0] B,       // operand B
    input  wire [2:0]       SEL,     // ALU opcode
    output reg  [WIDTH-1:0] Y,       // result
    output wire             ZERO     // Y == 0 ?
);

    //------------------------------------------------------
    // Combinational ALU
    //------------------------------------------------------
    always @(*) begin
        case (SEL)
            3'b000: Y = A +  B;      // ADD
            3'b001: Y = A -  B;      // SUB
            3'b010: Y = A &  B;      // AND
            3'b011: Y = A |  B;      // OR
            3'b100: Y = A ^  B;      // XOR
            3'b101: Y = A << 1;      // shift‑left logical (by 1)
            3'b110: Y = A >> 1;      // shift‑right logical (by 1)
            default: Y = {WIDTH{1'b0}}; // default 0
        endcase
    end

    //------------------------------------------------------
    // Status flag(s)
    //------------------------------------------------------
    assign ZERO = (Y == {WIDTH{1'b0}});

endmodule
