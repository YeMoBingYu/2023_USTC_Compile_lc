; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/6-array.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = alloca i32
  store i32 0, i32* %op1
  %op2 = icmp slt i32 0, 0
  br i1 %op2, label %label3, label %label4
label3:                                                ; preds = %label_entry
  call void @neg_idx_except()
  ret i32 0
label4:                                                ; preds = %label_entry
  %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  store i32 11, i32* %op5
  %op6 = icmp slt i32 4, 0
  br i1 %op6, label %label7, label %label8
label7:                                                ; preds = %label4
  call void @neg_idx_except()
  ret i32 0
label8:                                                ; preds = %label4
  %op9 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
  store i32 22, i32* %op9
  %op10 = icmp slt i32 9, 0
  br i1 %op10, label %label11, label %label12
label11:                                                ; preds = %label8
  call void @neg_idx_except()
  ret i32 0
label12:                                                ; preds = %label8
  %op13 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
  store i32 33, i32* %op13
  %op14 = icmp slt i32 0, 0
  br i1 %op14, label %label15, label %label16
label15:                                                ; preds = %label12
  call void @neg_idx_except()
  ret i32 0
label16:                                                ; preds = %label12
  %op17 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op18 = load i32, i32* %op17
  call void @output(i32 %op18)
  %op19 = icmp slt i32 4, 0
  br i1 %op19, label %label20, label %label21
label20:                                                ; preds = %label16
  call void @neg_idx_except()
  ret i32 0
label21:                                                ; preds = %label16
  %op22 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
  %op23 = load i32, i32* %op22
  call void @output(i32 %op23)
  %op24 = icmp slt i32 9, 0
  br i1 %op24, label %label25, label %label26
label25:                                                ; preds = %label21
  call void @neg_idx_except()
  ret i32 0
label26:                                                ; preds = %label21
  %op27 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
  %op28 = load i32, i32* %op27
  call void @output(i32 %op28)
  ret i32 0
}
