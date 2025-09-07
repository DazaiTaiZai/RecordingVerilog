// multiplexer 2 to 1 , basic practice shit.
module mux2to1(
    input  in, //  bit input 
    input sel,

    output reg Y // output reg Y , we could do it simply but that snto the fun part now that we are capable enuff.

);
    always @(*) begin
        case (sel)
            0: Y = in[0];
            1: Y = in[1];
             
        endcase
        
    end
    
endmodule

// now we will step up and make a 8 input to 1 mux 
module 8to1mux (
    input [7:0] in, // 4 bit input , valued 1 each ... instead of creating 8 input regs , we do this for the stack of same type of var
    input [2:0] sel,
    output reg Y
);
    always @(*) begin
        case (sel)
            0: Y = in [0]    
            1: Y = in [1]    
            2: Y = in [2]    
            3: Y = in [3]    
            4: Y = in [4]    
            5: Y = in [5]    
            6: Y = in [6]    
            7: Y = in [7]    
            
        endcase
        
    end
    
    
endmodule

// time to create a decoder again from 2 to 4 first then we move on to some good stuff

module 2dc4 (
    input [1:0] in,
    output reg [3:0] Y,
    input dc
);
    integer k ;
    always @(dc , in) begin
        for (k = 0; k < 4 ; k = k +1 ) begin
            // loop will iterate 4 times fof 4 diff assignings to the Y (hardware ke context mei we dont usually use the runtime loop , loops in hdls are used just to make repetations less)
            if (in) begin
                Y[k] = 1'b1;
                
            end

        end        
    end
    
endmodule

// time to make a decoder but better 3dc8
module 3dc8 (
    input [2:0] in, 
    output reg [7:0] Y,
    input dc
);
    integer k;
    
    always @(dc , in) begin
        for (k = 0; k < 8; k = k +1) begin
            if (in == k) begin
                Y[k] = 1'b1;
            end
        end
        
    end
    
endmodule
