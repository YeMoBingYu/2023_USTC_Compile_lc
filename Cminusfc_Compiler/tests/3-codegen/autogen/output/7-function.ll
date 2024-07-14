; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/7-function.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @min(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op2
  %op5 = load i32, i32* %op3
  %op6 = icmp sle i32 %op4, %op5
  %op7 = zext i1 %op6 to i32
  %op8 = icmp ne i32 %op7, 0
  br i1 %op8, label %label9, label %label12
label9:                                                ; preds = %label_entry
  %op10 = load i32, i32* %op2
  ret i32 %op10
label11:
  ret i32 0
label12:                                                ; preds = %label_entry
  %op13 = load i32, i32* %op3
  ret i32 %op13
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 11, i32* %op0
  store i32 22, i32* %op1
  store i32 33, i32* %op2
  %op3 = load i32, i32* %op0
  %op4 = load i32, i32* %op1
  %op5 = call i32 @min(i32 %op3, i32 %op4)
  call void @output(i32 %op5)
  %op6 = load i32, i32* %op1
  %op7 = load i32, i32* %op2
  %op8 = call i32 @min(i32 %op6, i32 %op7)
  call void @output(i32 %op8)
  %op9 = load i32, i32* %op2
  %op10 = load i32, i32* %op0
  %op11 = call i32 @min(i32 %op9, i32 %op10)
  call void @output(i32 %op11)
  ret i32 0
}
