// Benchmark "serialadder" written by ABC on Sat Oct  2 21:59:19 2021

module serialadder ( clock, 
    a, b, c, d,
    S  );
  input  clock;
  input  a, b, c, d;
  output S;
  reg \serialadder|cin0 , \serialadder|cin1 ;
  wire n15, n18;
  assign S = ((~d ^ \serialadder|cin0 ) & (a ? (~b ^ c) : (b ^ c))) | ((d ^ \serialadder|cin0 ) & (a ? (b ^ c) : (~b ^ c)));
  assign n15 = ((\serialadder|cin1  ? (c ? (d & \serialadder|cin0 ) : (~d & ~\serialadder|cin0 )) : ((~c & d) | (c & ~d) | (~c & ~d & \serialadder|cin0 ) | (c & d & ~\serialadder|cin0 ))) & (a ^ b)) | (a & b & (c ? (d & \serialadder|cin1 ) : (~d & ~\serialadder|cin1 ))) | (~a & ~b & (c ? (d & ~\serialadder|cin1 ) : (~d & \serialadder|cin1 ))) | ((c ^ d) & (a ? (b & (~\serialadder|cin0  ^ \serialadder|cin1 )) : (~b & (\serialadder|cin0  ^ \serialadder|cin1 ))));
  assign n18 = (\serialadder|cin1  & (((c ^ d) & (a ^ b)) | (~a & ~b & c & d) | (a & b & ~c & ~d))) | (c & d & a & b) | ((c ^ d) & ((a & b & (\serialadder|cin0  | (~\serialadder|cin0  & \serialadder|cin1 ))) | (\serialadder|cin0  & \serialadder|cin1  & ~a & ~b))) | ((a ^ b) & ((c & d & (\serialadder|cin0  | (~\serialadder|cin0  & \serialadder|cin1 ))) | (\serialadder|cin0  & \serialadder|cin1  & ~c & ~d)));
  always @ (posedge clock) begin
    \serialadder|cin0  <= n15;
    \serialadder|cin1  <= n18;
  end
  initial begin
    \serialadder|cin0  <= 1'b0;
    \serialadder|cin1  <= 1'b0;
  end
endmodule


