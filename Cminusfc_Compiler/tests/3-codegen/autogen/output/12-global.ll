; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/12-global.cminus"

@seed = global i32 zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @randomLCG() {
label_entry:
  %op0 = load i32, i32* @seed
  %op1 = mul i32 %op0, 1103515245
  %op2 = add i32 %op1, 12345
  store i32 %op2, i32* @seed
  %op3 = load i32, i32* @seed
  ret i32 %op3
}
define i32 @randBin() {
label_entry:
  %op0 = call i32 @randomLCG()
  %op1 = icmp sgt i32 %op0, 0
  %op2 = zext i1 %op1 to i32
  %op3 = icmp ne i32 %op2, 0
  br i1 %op3, label %label4, label %label6
label4:                                                ; preds = %label_entry
  ret i32 1
label5:
  ret i32 0
label6:                                                ; preds = %label_entry
  ret i32 0
}
define i32 @returnToZeroSteps() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 0, i32* %op0
  store i32 0, i32* %op1
  br label %label2
label2:                                                ; preds = %label_entry, %label26
  %op3 = load i32, i32* %op1
  %op4 = icmp slt i32 %op3, 20
  %op5 = zext i1 %op4 to i32
  %op6 = icmp ne i32 %op5, 0
  br i1 %op6, label %label7, label %label10
label7:                                                ; preds = %label2
  %op8 = call i32 @randBin()
  %op9 = icmp ne i32 %op8, 0
  br i1 %op9, label %label11, label %label21
label10:                                                ; preds = %label2
  ret i32 20
label11:                                                ; preds = %label7
  %op12 = load i32, i32* %op0
  %op13 = add i32 %op12, 1
  store i32 %op13, i32* %op0
  br label %label14
label14:                                                ; preds = %label11, %label21
  %op15 = load i32, i32* %op1
  %op16 = add i32 %op15, 1
  store i32 %op16, i32* %op1
  %op17 = load i32, i32* %op0
  %op18 = icmp eq i32 %op17, 0
  %op19 = zext i1 %op18 to i32
  %op20 = icmp ne i32 %op19, 0
  br i1 %op20, label %label24, label %label26
label21:                                                ; preds = %label7
  %op22 = load i32, i32* %op0
  %op23 = sub i32 %op22, 1
  store i32 %op23, i32* %op0
  br label %label14
label24:                                                ; preds = %label14
  %op25 = load i32, i32* %op1
  ret i32 %op25
label26:                                                ; preds = %label14
  br label %label2
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  store i32 3407, i32* @seed
  br label %label1
label1:                                                ; preds = %label_entry, %label6
  %op2 = load i32, i32* %op0
  %op3 = icmp slt i32 %op2, 20
  %op4 = zext i1 %op3 to i32
  %op5 = icmp ne i32 %op4, 0
  br i1 %op5, label %label6, label %label10
label6:                                                ; preds = %label1
  %op7 = call i32 @returnToZeroSteps()
  call void @output(i32 %op7)
  %op8 = load i32, i32* %op0
  %op9 = add i32 %op8, 1
  store i32 %op9, i32* %op0
  br label %label1
label10:                                                ; preds = %label1
  ret i32 0
}
