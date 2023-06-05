`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2023 21:42:22
// Design Name: 
// Module Name: multiplier
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


module multiplier(A,B,C,clk,start,Bzero,reset,dcr,done);
    input [3:0]A,B;
    output Bzero,reset,dcr,done;
    output [7:0]C;
    input clk,start;
    cp control_path(ldA,ldB,clk,start,dcr,Bzero,done,reset);
    dp data_path(ldA,ldB,clk,dcr,Bzero,reset,A,B,C);
endmodule
