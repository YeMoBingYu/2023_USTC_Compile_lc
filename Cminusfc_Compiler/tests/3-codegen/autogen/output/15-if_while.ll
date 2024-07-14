; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/15-if_while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 0, i32* %op1
  store i32 0, i32* %op2
  store i32 10, i32* %op0
  br label %label3
label3:                                                ; preds = %label_entry, %label21
  %op4 = load i32, i32* %op0
  %op5 = icmp ne i32 %op4, 0
  br i1 %op5, label %label6, label %label13
label6:                                                ; preds = %label3
  %op7 = load i32, i32* %op0
  %op8 = sub i32 %op7, 1
  store i32 %op8, i32* %op0
  %op9 = load i32, i32* %op0
  %op10 = icmp slt i32 %op9, 5
  %op11 = zext i1 %op10 to i32
  %op12 = icmp ne i32 %op11, 0
  br i1 %op12, label %label17, label %label22
label13:                                                ; preds = %label3
  %op14 = load i32, i32* %op1
  %op15 = load i32, i32* %op2
  %op16 = add i32 %op14, %op15
  ret i32 %op16
label17:                                                ; preds = %label6
  %op18 = load i32, i32* %op1
  %op19 = load i32, i32* %op0
  %op20 = add i32 %op18, %op19
  store i32 %op20, i32* %op1
  br label %label21
label21:                                                ; preds = %label17, %label22
  br label %label3
label22:                                                ; preds = %label6
  %op23 = load i32, i32* %op2
  %op24 = load i32, i32* %op0
  %op25 = add i32 %op23, %op24
  store i32 %op25, i32* %op2
  br label %label21
}
