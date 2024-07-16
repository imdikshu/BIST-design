module MISR_4bit(dataIn, reset,clock, Q); //Q = data_out
    input [0:1] dataIn; //dataIn[0,1] = {sum, Cout}
    input reset,clock;  
    
    output reg [0:3] Q;
    
    always@(posedge clock or posedge reset) begin
       if(reset == 1)
          Q <= 4'b0000;
       else begin
          Q[0] <= Q[3] ^ dataIn[0];
          Q[1] <= Q[3] ^ Q[1] ^ dataIn[1];
          Q[2] <= Q[1] ;
          Q[3] <= Q[2] ;
       end
    end
endmodule
