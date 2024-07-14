; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/2-calculate.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 23, i32* %op0
  store i32 25, i32* %op1
  store i32 4, i32* %op2
  %op3 = load i32, i32* %op0
  %op4 = load i32, i32* %op1
  %op5 = load i32, i32* %op2
  %op6 = mul i32 %op4, %op5
  %op7 = add i32 %op3, %op6
  ret i32 %op7
}
