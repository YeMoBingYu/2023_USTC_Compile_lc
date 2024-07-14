; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/11-funcall_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @addone(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = add i32 %op2, 1
  ret i32 %op3
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = call i32 @addone(i32 1230)
  %op2 = call i32 @addone(i32 %op1)
  %op3 = call i32 @addone(i32 %op2)
  %op4 = call i32 @addone(i32 %op3)
  store i32 %op4, i32* %op0
  %op5 = load i32, i32* %op0
  ret i32 %op5
}
