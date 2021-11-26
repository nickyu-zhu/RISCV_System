#!/usr/bin/env wolframscript
(* ::Package:: *)

WorkingDir = NotebookDirectory[];
sheet=Import[WorkingDir <> "/Control Signals.xlsx"];
sheet = sheet[[1]]; (* Select First sheet *)
controlBits = Transpose[sheet];


(* [ALU.X.DataFrom] [3] Substitution *)
controlBits[[3]] = 
controlBits[[3]]/.{"RS1" -> "00", "PC+4" -> "01", "Zero" -> "10", "PC" -> "11", "ANY" -> "00"};


(* [ALU.Y.DataFrom] [4] Substitution *)
controlBits[[4]] =
controlBits[[4]]/.{"RS2" -> "0", "Immed" -> "1", "ANY" -> "0"};


(* [ALU.OP] [5] Substitution *)
aluOPRule = {
	"A.PLUS"                   -> "000000",
	"A.MINUS"                  -> "000001",
	"A.PLUS_AND_SHIFT12"       -> "000010",
	"A.MUL_LOW"                -> "000011",
	"A.MUL_HIGH_SIGNED"        -> "000100",
	"A.MUL_HIGH_UNSIGN"        -> "000101",
	"A.MUL_HIGH_SIG_AND_UNSIG" -> "000110",
	"A.DIV_SIGNED"             -> "000111",
	"A.DIV_UNSIGNED"           -> "001000",
	"A.REM_SIGNED"             -> "001001",
	"A.REM_UNSIGNED"           -> "001010",
	"L.AND"                    -> "010000",
	"L.OR"                     -> "010001",
	"L.XOR"                    -> "010010",
	"L.SHIFT_L"                -> "010011",
	"L.SHIFT_R_LOGICAL"        -> "010100",
	"L.SHIFT_R_ARITH"          -> "010101",
	"C.SET_SIGN_LESS"          -> "100000",
	"C.SET_USIG_LESS"          -> "100001",
	"S.NOP"                    -> "110000"
	};
	controlBits[[5]]=
	controlBits[[5]]/.aluOPRule;
	


(* [ALU.Calc] [6] Substitution *)
controlBits[[6]]=
controlBits[[6]]/.{"No" -> "0", "Yes" -> "1"};	


(* [PC.DataFrom] [7] Substitution *)
controlBits[[7]]=
controlBits[[7]]/.
{"PC+4" -> "000", "BccPath" -> "001", "JALPath" -> "010",
 "JALRPath" -> "011", "CSRs[MEPC]" -> "100", "Variant" -> "000"};
 


 (* [PC.Write] [8] Substitution *)
controlBits[[8]]=
controlBits[[8]]/.{"No" -> "0", "Yes" -> "1"};


(* [REG.DataFrom] [9] Substitution *)
controlBits[[9]]=
controlBits[[9]]/.
{"ALU" -> "00", "MEM" -> "01", 
 "FRS1" -> "10", "CSR" -> "11","ANY" -> "00"};
 


 (* [REG.Read] [10] Substitution *)
controlBits[[10]]=
controlBits[[10]]/.{"No" -> "0", "Yes" -> "1"};


(* [REG.Write] [11] Substitution *)
controlBits[[11]]=
controlBits[[11]]/.{"No" -> "0", "Yes" -> "1"};


(* [MEM.AddrFrom] [12] Substitution *)
controlBits[[12]]=
controlBits[[12]]/.{"ALU" -> "0", "PC" -> "1", "ANY" -> "0"};


(* [MEM.DataFrom] [13] Substitution *)
controlBits[[13]]=
controlBits[[13]]/.{"RS2" -> "0", "FRS2" -> "1", "ANY" -> "0"};


(* [MEM.Read] [14] Substitution *)
controlBits[[14]]=
controlBits[[14]]/.{"No" -> "0", "Yes" -> "1"};


(* [MEM.Write] [15] Substitution *)
controlBits[[15]]=
controlBits[[15]]/.{"No" -> "0", "Yes" -> "1"};


(* [MEM.Mode] [16] Substitution *)
controlBits[[16]]=
controlBits[[16]]/.{"BYTE" -> "00", "HWORD" -> "01", "WORD" -> "10", "ANY" -> "00"};


(* [MEM.SignExt] [17] Substitution *)
controlBits[[17]]=
controlBits[[17]]/.{"Zero" -> "0", "Sign" -> "1", "ANY" -> "0"};


(* [FLREG.DataFrom] [18] Substitution *)
controlBits[[18]]=
controlBits[[18]]/.{"ANY" -> "00"};


(* [FLREG.Read] [19] Substitution *)
controlBits[[19]]=
controlBits[[19]]/.{"ANY" -> "0"};


(* [FLREG.Write] [20] Substitution *)
controlBits[[20]]=
controlBits[[20]]/.{"ANY" -> "0"};


(* [FPU.X.DataFrom] [21] Substitution *)
controlBits[[21]]=
controlBits[[21]]/.{"ANY" -> "0"};


(* [FPU.OP] [22] Substitution *)
controlBits[[22]]=
controlBits[[22]]/.{"ANY" -> "0000000"};


(* [FPU.Calc] [23] Substitution *)
controlBits[[23]]=
controlBits[[23]]/.{"ANY" -> "0"};


(* [CSR.DataFrom] [24] Substitution *)
controlBits[[24]]=
controlBits[[24]]/.{"RS1" -> "0", "Immed-5" -> "1", "ANY" -> "0"};


(* [CSR.OP] [25] Substitution *)
controlBits[[25]]=
controlBits[[25]]/.
{"NOP" -> "00", "Assign" -> "01", 
 "ORAssign" -> "10", "NANDAssign" -> "11"};


(* [CSR.Write] [26] Substitution *)
controlBits[[26]]=
controlBits[[26]]/.{"No" -> "0", "Yes" -> "1", "Variant" -> "0"};


(* [TRAP.ECALL] [27] Substitution *)
controlBits[[27]]=
controlBits[[27]]/.{"No" -> "0", "Yes" -> "1"};


(* [TRAP.EBREAK] [28] Substitution *)
controlBits[[28]]=
controlBits[[28]]/.{"No" -> "0", "Yes" -> "1"};


(* [TRAP.MRET] [29] Substitution *)
controlBits[[29]]=
controlBits[[29]]/.{"No" -> "0", "Yes" -> "1"};


processControlBits[range_, name_]:=
(
Block[{head, data, table, hexrule},
(
	hexrule={0->"0",1->"1",2->"2",3->"3",4->"4",5->"5",6->"6",7->"7",8->"8",9->"9",10->"a",
11->"b",12->"c",13->"d",14->"e",15->"f"};
	table = Transpose[controlBits[[range]]];
	head = table[[1]];
	data = table[[2;;]];
	data = Join[#,{StringJoin[Reverse[#]]}]&/@data;
	data = Join[#, {
	                StringJoin[IntegerDigits[FromDigits[#[[-1]],2]/.{"1"->1,"0"->0},
                                  16,
                                  Ceiling[Length[Characters[data[[1]][[-1]]]]/4]]/.hexrule]}]&/@data;
	(*Print[
	FromDigits[#,2]&/@((Characters[#\[LeftDoubleBracket]-1\[RightDoubleBracket]]&/@data)/.{"1"\[Rule]1,"0"\[Rule]0}),
    IntegerDigits[FromDigits[#,2]&/@((Characters[#\[LeftDoubleBracket]-1\[RightDoubleBracket]]&/@data)/.{"1"\[Rule]1,"0"\[Rule]0}),
                  16,
                  Ceiling[Length[Characters[data\[LeftDoubleBracket]1\[RightDoubleBracket]\[LeftDoubleBracket]-1\[RightDoubleBracket]]]/4]]/.hexrule
	];*)
	head = Join[head, {name,name <> "_hex"}];
	Return[Join[{head},data]];
)]
)


basic = processControlBits[3;;17, "BasicControl"];
float = processControlBits[18;;23, "FloatControl"];
csr = processControlBits[24;;29, "CSRsControl"];
out = Transpose[Flatten[Transpose/@{Transpose[Transpose[sheet][[1;;2]]],basic,float,csr},1]];


Export[WorkingDir <> "/Export_Controller_Signals.xlsx", out];
