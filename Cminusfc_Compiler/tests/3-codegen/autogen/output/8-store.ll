; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/8-store.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @store(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op3 = alloca i32*
  store i32* %arg0, i32** %op3
  %op4 = alloca i32
  store i32 %arg1, i32* %op4
  %op5 = alloca i32
  store i32 %arg2, i32* %op5
  %op6 = load i32, i32* %op5
  %op7 = load i32, i32* %op4
  %op8 = icmp slt i32 %op7, 0
  br i1 %op8, label %label9, label %label10
label9:                                                ; preds = %label_entry
  call void @neg_idx_except()
  ret i32 0
label10:                                                ; preds = %label_entry
  %op11 = load i32*, i32** %op3
  %op12 = getelementptr i32, i32* %op11, i32 %op7
  store i32 %op6, i32* %op12
  %op13 = load i32, i32* %op5
  ret i32 %op13
}
define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 0, i32* %op1
  br label %label3
label3:                                                ; preds = %label_entry, %label8
  %op4 = load i32, i32* %op1
  %op5 = icmp slt i32 %op4, 10
  %op6 = zext i1 %op5 to i32
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label8, label %label16
label8:                                                ; preds = %label3
  %op9 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op10 = load i32, i32* %op1
  %op11 = load i32, i32* %op1
  %op12 = mul i32 %op11, 2
  %op13 = call i32 @store(i32* %op9, i32 %op10, i32 %op12)
  %op14 = load i32, i32* %op1
  %op15 = add i32 %op14, 1
  store i32 %op15, i32* %op1
  br label %label3
label16:                                                ; preds = %label3
  store i32 0, i32* %op2
  store i32 0, i32* %op1
  br label %label17
label17:                                                ; preds = %label16, %label29
  %op18 = load i32, i32* %op1
  %op19 = icmp slt i32 %op18, 10
  %op20 = zext i1 %op19 to i32
  %op21 = icmp ne i32 %op20, 0
  br i1 %op21, label %label22, label %label26
label22:                                                ; preds = %label17
  %op23 = load i32, i32* %op2
  %op24 = load i32, i32* %op1
  %op25 = icmp slt i32 %op24, 0
  br i1 %op25, label %label28, label %label29
label26:                                                ; preds = %label17
  %op27 = load i32, i32* %op2
  call void @output(i32 %op27)
  ret i32 0
label28:                                                ; preds = %label22
  call void @neg_idx_except()
  ret i32 0
label29:                                                ; preds = %label22
  %op30 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op24
  %op31 = load i32, i32* %op30
  %op32 = add i32 %op23, %op31
  store i32 %op32, i32* %op2
  %op33 = load i32, i32* %op1
  %op34 = add i32 %op33, 1
  store i32 %op34, i32* %op1
  br label %label17
}
