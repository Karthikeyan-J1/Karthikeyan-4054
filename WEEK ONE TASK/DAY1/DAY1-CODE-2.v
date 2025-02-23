1.SIMPLE WIRE:
module top_module( input in, output out );
assign out=in;
endmodule

2.FOUR WIRE:
module top_module( 
    input a,b,c,
    output w,x,y,z );
assign w=a;
assign x=b;
assign y=b;
assign z=c;
endmodule

3.NOT GATE:
module top_module( input in, output out );
assign out=~in;
endmodule

4.AND GATE:
module top_module( 
    input a, 
    input b, 
    output out );
assign out= a && b;
endmodule

5.NOR GATE:
module top_module( 
    input a, 
    input b, 
    output out );
assign out=~a && ~b;
endmodule

6.XNOR GATE:
module top_module( 
    input a, 
    input b, 
    output out );
    assign out=~(a ^ b);
endmodule

7.WIRE DECL:
`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire and1,and2,or1;
    assign and1=a && b;
    assign and2=c && d;
    assign or1=and1 | and2;
    assign out=or1;
    assign out_n=~or1;
    
endmodule

8.7458 CHIP:
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
wire i1,i2,i3,i4,i5,i6; 
    assign i1=p2a & p2b; 
    assign i2=p2c & p2d; 
    assign i3=p1a & p1c & p1b; 
    assign i4=p1f & p1e & p1d; 
    assign i5=i1 | i2; 
    assign i6=i3 | i4; 
    assign p2y=i5; 
    assign p1y=i6;

endmodule
