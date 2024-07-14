; ModuleID = 'cminus'
source_filename = "/home/bingyu/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases_general/20-gcd_array.cminus"

@x = global [1 x i32] zeroinitializer
@y = global [1 x i32] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @gcd(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op3
  %op5 = icmp eq i32 %op4, 0
  %op6 = zext i1 %op5 to i32
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label8, label %label11
label8:                                                ; preds = %label_entry
  %op9 = load i32, i32* %op2
  ret i32 %op9
label10:
  ret i32 0
label11:                                                ; preds = %label_entry
  %op12 = load i32, i32* %op3
  %op13 = load i32, i32* %op2
  %op14 = load i32, i32* %op2
  %op15 = load i32, i32* %op3
  %op16 = sdiv i32 %op14, %op15
  %op17 = load i32, i32* %op3
  %op18 = mul i32 %op16, %op17
  %op19 = sub i32 %op13, %op18
  %op20 = call i32 @gcd(i32 %op12, i32 %op19)
  ret i32 %op20
}
define i32 @funArray(i32* %arg0, i32* %arg1) {
label_entry:
  %op2 = alloca i32*
  store i32* %arg0, i32** %op2
  %op3 = alloca i32*
  store i32* %arg1, i32** %op3
  %op4 = alloca i32
  %op5 = alloca i32
  %op6 = alloca i32
  %op7 = icmp slt i32 0, 0
  br i1 %op7, label %label8, label %label9
label8:                                                ; preds = %label_entry
  call void @neg_idx_except()
  ret i32 0
label9:                                                ; preds = %label_entry
  %op10 = load i32*, i32** %op2
  %op11 = getelementptr i32, i32* %op10, i32 0
  %op12 = load i32, i32* %op11
  store i32 %op12, i32* %op4
  %op13 = icmp slt i32 0, 0
  br i1 %op13, label %label14, label %label15
label14:                                                ; preds = %label9
  call void @neg_idx_except()
  ret i32 0
label15:                                                ; preds = %label9
  %op16 = load i32*, i32** %op3
  %op17 = getelementptr i32, i32* %op16, i32 0
  %op18 = load i32, i32* %op17
  store i32 %op18, i32* %op5
  %op19 = load i32, i32* %op4
  %op20 = load i32, i32* %op5
  %op21 = icmp slt i32 %op19, %op20
  %op22 = zext i1 %op21 to i32
  %op23 = icmp ne i32 %op22, 0
  br i1 %op23, label %label24, label %label28
label24:                                                ; preds = %label15
  %op25 = load i32, i32* %op4
  store i32 %op25, i32* %op6
  %op26 = load i32, i32* %op5
  store i32 %op26, i32* %op4
  %op27 = load i32, i32* %op6
  store i32 %op27, i32* %op5
  br label %label28
label28:                                                ; preds = %label15, %label24
  %op29 = load i32, i32* %op4
  %op30 = load i32, i32* %op5
  %op31 = call i32 @gcd(i32 %op29, i32 %op30)
  ret i32 %op31
}
define i32 @main() {
label_entry:
  %op0 = icmp slt i32 0, 0
  br i1 %op0, label %label1, label %label2
label1:                                                ; preds = %label_entry
  call void @neg_idx_except()
  ret i32 0
label2:                                                ; preds = %label_entry
  %op3 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
  store i32 90, i32* %op3
  %op4 = icmp slt i32 0, 0
  br i1 %op4, label %label5, label %label6
label5:                                                ; preds = %label2
  call void @neg_idx_except()
  ret i32 0
label6:                                                ; preds = %label2
  %op7 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
  store i32 18, i32* %op7
  %op8 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
  %op9 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
  %op10 = call i32 @funArray(i32* %op8, i32* %op9)
  ret i32 %op10
}
