; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/5-while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

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
  br i1 %op7, label %label8, label %label12
label8:                                                ; preds = %label2
  %op9 = load i32, i32* %op1
  call void @output(i32 %op9)
  %op10 = load i32, i32* %op1
  %op11 = add i32 %op10, 1
  store i32 %op11, i32* %op1
  br label %label2
label12:                                                ; preds = %label2
  ret i32 0
}
