`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2023 21:42:22
// Design Name: 
// Module Name: cp
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



module cp(ldA,ldB,clk,start,dcr,Bzero,done,reset);
    input clk,start,Bzero;
    output reg ldA,ldB,dcr,done,reset;
    reg [3:0]state;
    parameter S0=4'b0000, S1=4'b0001, S2=4'b0010, S3=4'b0011, S4=4'b0100;
    always @(posedge clk) 
    begin
        case(state)
        S0:  if(start) state<= S1;
        S1:  begin if (~Bzero) state<=S2; else state<=S4; end
        S2:  state<=S3; 
        S3: #1 begin  if (~Bzero) state<=S2; else state<=S4; end
        S4:  if (start) state<=S1;
        default: state<=S0;
        endcase
    end
    always @(posedge clk)
    begin
    case (state)
        S0: begin reset<=1; done<=0; end
        S1: begin reset<=0; ldA<=1; ldB<=1; end
        S2: begin ldB<=0; ldA<=0; dcr <=1 ;end
        S3: dcr<=0;
        S4: done<=1;  
        default: begin reset<=0; ldA<=0; ldB<=0; dcr<=0; done<=0; end
        endcase
    end
endmodule