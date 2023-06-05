`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2023 21:42:22
// Design Name: 
// Module Name: dp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module dp(ldA,ldB,clk,dcr,Bzero,reset,A,B,C);
    input [3:0]A,B;
    input ldA,ldB,dcr,reset,clk;
    output  Bzero;
    output [7:0]C;
    wire [4:0]bus;
    A_reg A1(A,bus,ldA,reset,clk);
    B_reg B1(B,dout,ldB,reset,clk,dcr,Bzero);
    C_reg C1(bus,C,reset,clk,dcr);
endmodule

module A_reg(din,dout,ld,reset,clk);
    input [3:0]din;
    input ld,reset,clk;
    output reg [3:0]dout;
    always @(posedge clk)
    begin
        if (reset) dout<=4'b0000;
        if (ld) dout<=din;
    end
endmodule

module B_reg(din,dout,ld,reset,clk,dcr,Bzero);
    input [3:0]din;
    input ld,reset,clk,dcr;
    output reg Bzero;
    output reg [3:0]dout;
    initial Bzero<=0;
    always @(posedge clk)
    begin
        if (reset) dout<=4'bxxxx;
        if (ld) dout<=din;
        if (dcr) dout<= dout-1;
        //if (dout == 0 ) Bzero<=1;
    end
    always @(dout)
    if (dout == 0 ) Bzero<=1;
endmodule

module C_reg(din,dout,reset,clk,dcr);
    input [3:0]din;
    input dcr,clk,reset;
    output reg [7:0]dout;
    always @(posedge clk)
    begin
        if (reset) dout<=0;
        if (dcr) dout<=dout+din;
   end
endmodule
    

