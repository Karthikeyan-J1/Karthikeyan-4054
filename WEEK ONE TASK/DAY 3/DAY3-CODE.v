1. IF STATEMENT
// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    assign out_assign = sel_b1 & sel_b2 ? b : a;
always @(*)
    if (sel_b1 & sel_b2) 
         out_always = b;
    else 
         out_always = a;

endmodule


2.IF STATEMENT LATCHES
// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //
    always @(*)
        if (cpu_overheated) 
            shut_off_computer=1;
    else 
        shut_off_computer=0;
always @(*)
    if (~arrived) 
        keep_driving=~gas_tank_empty;
    else 
        keep_driving=0;

endmodule

3.CASE STATEMENT
// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//
    always@(*) begin // This is a combinational circuit
        case (sel)
            0:out=data0;
            1:out=data1;
            2:out=data2;
            3:out=data3;
            4:out=data4;
            5:out=data5;
            default:out=0;
        endcase
    end

endmodule

4.PRIORITY ENCODER
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*)
    casex (in)
        4'bxxx1:pos=0;
        4'bxx10:pos=1;
        4'bx100:pos=2;
        4'b1000:pos=3;
        default:pos=0;
    endcase

endmodule


5.ALWAYS CASEZ
// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );
always @(*)
    casez (in)
        8'b???????1:pos=0;
        8'b??????10:pos=1;
        8'b?????100:pos=2;
        8'b????1000:pos=3;
        8'b???10000:pos=4;
        8'b??100000:pos=5;
        8'b?1000000:pos=6;
        8'b10000000:pos=7;
        default:pos=0;
    endcase
endmodule


6.AVOIDING LATCHES
// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    always @(*) begin
    {up,down,left,right}=4'b0;
    case (scancode)
        16'he06b:left=1;
        16'he072:down=1;
        16'he074:right=1;
        16'he075:up=1;
    endcase
    end

endmodule
