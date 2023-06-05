`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2023 23:06:52
// Design Name: 
// Module Name: tb
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


module tb();
    reg [3:0]A,B;
    reg clk,start;
    wire [7:0]C;
    multiplier dit(A,B,C,clk,start,Bzero,reset,dcr,done);
    initial begin
    clk=0;
    forever #5 clk=~clk;
    end
    initial begin
    A=3; B=4; start=1;
    #30
    start=0;
    #150
    $finish;
    end
endmodule
