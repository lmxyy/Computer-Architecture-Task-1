module adder(x,y,sum);
   parameter maxn = 16;

   input [maxn-1:0] x,y;
   output [maxn-1:0] sum;

   reg [maxn:0] C;
   reg [maxn-1:0] sum;
   integer i;
	 
   always @(x,y)
	 begin
		C[0] = 0;
		for (i = 0;i < maxn;i = i+1)
		  begin
			 sum[i] = x[i]^y[i]^C[i];
			 C[i+1] = (x[i]&y[i])^(C[i]&(x[i]^y[i]));
		  end
	 end		
endmodule // adder

