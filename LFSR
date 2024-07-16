module LFSR(data_out, cycle_repeat, reset, clock);
    input reset;
    input clock;
    
    output [0:2] data_out;  //provides current state of lfsr {last me use}
    output reg cycle_repeat ; //A flag that indicates when LFSR has cycled through all possible states... complete = cycle_repeat
    
    reg [0:2] Q;	//Q = 3 bit register representing current state of LFSR ....Q = lfsr_reg	
    reg [2:0] count; //keeps count of shifts performed by lfsr {kitni clocks jaa chuki}
    
    always@(posedge clock or posedge reset) begin //rising edge of clk or when reset signal is asserted
       if(reset == 1) begin
           Q <= 9'b001;   
           count <= 3'b000;  
       end
       else begin
            Q[0] <= Q[2];
            Q[1] <= Q[0] ^ Q[2];
            Q[2] <= Q[1];
            count = count + 1; //incrementing count 
            if(count <= 3'b110) //in our example Q repeats after 6 cycle so whenver count > 6 ,cycle = 1
               cycle_repeat = 0;
            else
               cycle_repeat = 1; 
       end
    end
    
    assign data_out = Q;  //data_out is assigned current value of Q register
endmodule
