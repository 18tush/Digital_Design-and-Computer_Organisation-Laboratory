// Write code for modules you need here
module fadd(input wire a, b, cin, output wire sum, cout);
    wire t0,t1,t2,t3;
    xor2 f0(a,b,t0);
    xor2 f1(t0,cin,sum);
    and2 f2(a,b,t1);
    and2 f3(b,cin,t2);
    and2 f4(cin,a,t3);
    or3 f5(t1,t2,t3,cout);
endmodule

module addsub(input wire mode,i0,i1,cin,output wire sumdiff,cout);
    wire t1;
    xor2 f0_0(i1,mode,t1);
    fadd f1_0(i0,t1,cin,sumdiff,cout);
endmodule

module pc_slice_1 (input wire clk,reset,offset,inc,sub,load_wire, output wire pc,cout);
    wire t1,t2;
    or2 f1(offset,inc,t1);
    addsub f2(sub,pc,t1,sub,t2,cout);
    dfrl f3(clk,reset,load_wire,t2,pc);
endmodule

module pc_slice_2 (input wire clk,reset,offset,inc,sub,load_wire,cin, output wire pc,cout);
    wire t1,t2,t3;
    invert i(inc,t1);
    and2 o0(offset,t1,t2);
    addsub o2(sub,pc,t2,cin,t3,cout);
    dfrl o3(clk,reset,load_wire,t3,pc);
endmodule

module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset, output wire [15:0] pc);

// Declare wires here
    wire[15:0]cout;
    wire load_wire;
// Instantiate modules here
    or3 o(inc,add,sub,load_wire);
    pc_slice_1 f0(clk,reset,offset[0],inc,sub,load_wire,pc[0],cout[0]);
    pc_slice_2 f1(clk,reset,offset[1],inc,sub,load_wire,cout[0],pc[1],cout[1]);
    pc_slice_2 f2(clk,reset,offset[2],inc,sub,load_wire,cout[1],pc[2],cout[2]);
    pc_slice_2 f3(clk,reset,offset[3],inc,sub,load_wire,cout[2],pc[3],cout[3]);
    pc_slice_2 f4(clk,reset,offset[4],inc,sub,load_wire,cout[3],pc[4],cout[4]);
    pc_slice_2 f5(clk,reset,offset[5],inc,sub,load_wire,cout[4],pc[5],cout[5]);
    pc_slice_2 f6(clk,reset,offset[6],inc,sub,load_wire,cout[5],pc[6],cout[6]);
    pc_slice_2 f7(clk,reset,offset[7],inc,sub,load_wire,cout[6],pc[7],cout[7]);
    pc_slice_2 f8(clk,reset,offset[8],inc,sub,load_wire,cout[7],pc[8],cout[8]);
    pc_slice_2 f9(clk,reset,offset[9],inc,sub,load_wire,cout[8],pc[9],cout[9]);
    pc_slice_2 f10(clk,reset,offset[10],inc,sub,load_wire,cout[9],pc[10],cout[10]);
    pc_slice_2 f11(clk,reset,offset[11],inc,sub,load_wire,cout[10],pc[11],cout[11]);
    pc_slice_2 f12(clk,reset,offset[12],inc,sub,load_wire,cout[11],pc[12],cout[12]);
    pc_slice_2 f13(clk,reset,offset[13],inc,sub,load_wire,cout[12],pc[13],cout[13]);
    pc_slice_2 f14(clk,reset,offset[14],inc,sub,load_wire,cout[13],pc[14],cout[14]);
    pc_slice_2 f15(clk,reset,offset[15],inc,sub,load_wire,cout[14],pc[15],cout[15]);   
endmodule
