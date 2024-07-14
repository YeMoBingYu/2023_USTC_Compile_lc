; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/6-num_add_int.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = add i32 1000, 234
  store i32 %op1, i32* %op0
  %op2 = load i32, i32* %op0
  ret i32 %op2
}
