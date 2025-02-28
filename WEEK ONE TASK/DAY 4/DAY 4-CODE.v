1.VECTOR 0
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
    assign o0=vec[0];
    assign o1=vec[1];
    assign o2=vec[2];
    assign outv=vec;

endmodule


2.VECTOR 1
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
assign out_hi=in[15:8];
assign out_lo=in[7:0];


endmodule


3.VECTOR 2
module top_module( 
    input [31:0] in,
    output [31:0] out );//

    // assign out[31:24] = ...;
assign out[31:24]=in[7:0];
assign out[23:16]=in[15:8];
assign out[15:8]=in[23:16];
assign out[7:0]=in[31:24];


endmodule


4.VECTOR GATES
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
assign out_or_bitwise=a | b;
assign out_or_logical=a || b;
assign out_not=~{b,a};


endmodule


5.GATES 4
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
assign out_and=&in;
assign out_xor=^in;
assign out_or=|in;


endmodule


6.VECTOR 3
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
assign {w,x,y,z} = {a,b,c,d,e,f,2'b11};


endmodule


7.VECTORR
module top_module( 
    input [7:0] in,
    output [7:0] out
);
assign out={in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};

endmodule


8. VECTOR 4
module top_module (
    input [7:0] in,
    output [31:0] out );//

    // assign out = { replicate-sign-bit , the-input };
assign out={{24{in[7]}}, in};

endmodule

9. VECTOR 5
module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
wire [24:0] concat1;
wire [24:0] concat2;
assign concat1={{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
assign concat2={5{a, b, c, d, e}};
assign out=~concat1 ^ concat2;


endmodule
