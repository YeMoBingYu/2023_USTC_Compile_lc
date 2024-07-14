; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/4-if.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

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
  %op5 = icmp sgt i32 %op3, %op4
  %op6 = zext i1 %op5 to i32
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label8, label %label15
label8:                                                ; preds = %label_entry
  %op9 = load i32, i32* %op0
  %op10 = load i32, i32* %op2
  %op11 = icmp sgt i32 %op9, %op10
  %op12 = zext i1 %op11 to i32
  %op13 = icmp ne i32 %op12, 0
  br i1 %op13, label %label21, label %label24
label14:                                                ; preds = %label23, %label28
  ret i32 0
label15:                                                ; preds = %label_entry
  %op16 = load i32, i32* %op2
  %op17 = load i32, i32* %op1
  %op18 = icmp slt i32 %op16, %op17
  %op19 = zext i1 %op18 to i32
  %op20 = icmp ne i32 %op19, 0
  br i1 %op20, label %label26, label %label29
label21:                                                ; preds = %label8
  %op22 = load i32, i32* %op0
  call void @output(i32 %op22)
  br label %label23
label23:                                                ; preds = %label21, %label24
  br label %label14
label24:                                                ; preds = %label8
  %op25 = load i32, i32* %op2
  call void @output(i32 %op25)
  br label %label23
label26:                                                ; preds = %label15
  %op27 = load i32, i32* %op1
  call void @output(i32 %op27)
  br label %label28
label28:                                                ; preds = %label26, %label29
  br label %label14
label29:                                                ; preds = %label15
  %op30 = load i32, i32* %op2
  call void @output(i32 %op30)
  br label %label28
}
