; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/9-assign_cast.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = icmp slt i32 1, 3
  %op3 = zext i1 %op2 to i32
  store i32 %op3, i32* %op0
  %op4 = sitofp i32 2 to float
  %op5 = fadd float %op4, 0x4003333340000000
  %op6 = fptosi float %op5 to i32
  store i32 %op6, i32* %op1
  %op7 = load i32, i32* %op0
  %op8 = load i32, i32* %op1
  %op9 = add i32 %op7, %op8
  ret i32 %op9
}
