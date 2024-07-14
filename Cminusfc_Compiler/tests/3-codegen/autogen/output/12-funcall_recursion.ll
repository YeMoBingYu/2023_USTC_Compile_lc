; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/12-funcall_recursion.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @factorial(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = icmp eq i32 %op2, 0
  %op4 = zext i1 %op3 to i32
  %op5 = icmp ne i32 %op4, 0
  br i1 %op5, label %label6, label %label8
label6:                                                ; preds = %label_entry
  ret i32 1
label7:
  ret i32 0
label8:                                                ; preds = %label_entry
  %op9 = load i32, i32* %op1
  %op10 = load i32, i32* %op1
  %op11 = sub i32 %op10, 1
  %op12 = call i32 @factorial(i32 %op11)
  %op13 = mul i32 %op9, %op12
  ret i32 %op13
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = call i32 @factorial(i32 10)
  store i32 %op1, i32* %op0
  %op2 = load i32, i32* %op0
  ret i32 %op2
}
