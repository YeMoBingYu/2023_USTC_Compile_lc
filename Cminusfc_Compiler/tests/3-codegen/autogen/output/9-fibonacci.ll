; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/9-fibonacci.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @fibonacci(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = icmp eq i32 %op2, 0
  %op4 = zext i1 %op3 to i32
  %op5 = icmp ne i32 %op4, 0
  br i1 %op5, label %label6, label %label8
label6:                                                ; preds = %label_entry
  ret i32 0
label7:                                                ; preds = %label14
  ret i32 0
label8:                                                ; preds = %label_entry
  %op9 = load i32, i32* %op1
  %op10 = icmp eq i32 %op9, 1
  %op11 = zext i1 %op10 to i32
  %op12 = icmp ne i32 %op11, 0
  br i1 %op12, label %label13, label %label15
label13:                                                ; preds = %label8
  ret i32 1
label14:
  br label %label7
label15:                                                ; preds = %label8
  %op16 = load i32, i32* %op1
  %op17 = sub i32 %op16, 1
  %op18 = call i32 @fibonacci(i32 %op17)
  %op19 = load i32, i32* %op1
  %op20 = sub i32 %op19, 2
  %op21 = call i32 @fibonacci(i32 %op20)
  %op22 = add i32 %op18, %op21
  ret i32 %op22
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 10, i32* %op0
  store i32 0, i32* %op1
  br label %label2
label2:                                                ; preds = %label_entry, %label8
  %op3 = load i32, i32* %op1
  %op4 = load i32, i32* %op0
  %op5 = icmp slt i32 %op3, %op4
  %op6 = zext i1 %op5 to i32
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label8, label %label13
label8:                                                ; preds = %label2
  %op9 = load i32, i32* %op1
  %op10 = call i32 @fibonacci(i32 %op9)
  call void @output(i32 %op10)
  %op11 = load i32, i32* %op1
  %op12 = add i32 %op11, 1
  store i32 %op12, i32* %op1
  br label %label2
label13:                                                ; preds = %label2
  ret i32 0
}
