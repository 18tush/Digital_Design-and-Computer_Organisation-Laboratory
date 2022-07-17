
module fulladd(input wire a, b, cin, output wire sum, cout);
wire [4:0] t;
    xor2 x0(a, b, t[0]);
    xor2 x1(t[0], cin, sum);

    and2 a0(a, b, t[1]);
    and2 a1(a, cin, t[2]);
    and2 a2(b, cin, t[3]);

    or2 o0(t[1], t[2], t[4]);
    or2 o1(t[3], t[4], cout);
endmodule


module alu_slice(input wire op0,op1,input wire i0,i1,cin,output wire cout,o);

wire t_xor,t_and,t_or,t_fa,t_mux;

xor2 x(i1,op0,t_xor);
fulladd f_1(i0,t_xor,cin,t_fa,cout);
and2 a_0(i0,i1,t_and);
or2 o_0(i0,i1,t_or);
mux2 m_0(t_and,t_or,op0,t_mux);
mux2 m_1(t_fa,t_mux,op1,o);

endmodule



module alu (input wire [1:0] op, input wire [15:0] i0, i1,
    output wire [15:0] o, output wire cout);

// Declare wires here
wire [14:0] c;

// Instantiate modules here
alu_slice as_0(op[0],op[1],i0[0],i1[0],op[0],c[0],o[0]);
alu_slice as_1(op[0],op[1],i0[1],i1[1],c[0],c[1],o[1]);
alu_slice as_2(op[0],op[1],i0[2],i1[2],c[1],c[2],o[2]);
alu_slice as_3(op[0],op[1],i0[3],i1[3],c[2],c[3],o[3]);
alu_slice as_4(op[0],op[1],i0[4],i1[4],c[3],c[4],o[4]);
alu_slice as_5(op[0],op[1],i0[5],i1[5],c[4],c[5],o[5]);
alu_slice as_6(op[0],op[1],i0[6],i1[6],c[5],c[6],o[6]);
alu_slice as_7(op[0],op[1],i0[7],i1[7],c[6],c[7],o[7]);
alu_slice as_8(op[0],op[1],i0[8],i1[8],c[7],c[8],o[8]);
alu_slice as_9(op[0],op[1],i0[9],i1[9],c[8],c[9],o[9]);
alu_slice as_10(op[0],op[1],i0[10],i1[10],c[9],c[10],o[10]);
alu_slice as_11(op[0],op[1],i0[11],i1[11],c[10],c[11],o[11]);

alu_slice as_12(op[0],op[1],i0[12],i1[12],c[11],c[12],o[12]);
alu_slice as_13(op[0],op[1],i0[13],i1[13],c[12],c[13],o[13]);
alu_slice as_14(op[0],op[1],i0[14],i1[14],c[13],c[14],o[14]);
alu_slice as_15(op[0],op[1],i0[15],i1[15],c[14],cout,o[15]);

endmodule