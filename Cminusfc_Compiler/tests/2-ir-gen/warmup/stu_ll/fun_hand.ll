; .ll文件中注释以';'开头
; ModuleID = 'assign.c'
source_filename = "assign.c"
; target的开始
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; callee函数的定义
; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @callee(i32 %a) #0{
; 第一个基本块的开始
    %temp1 = mul i32 %a, 2 ; temp1 = a * 2
    ret i32 %temp1 ; return temp1
; 第一个基本块的结束
}

; main函数的定义
; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %a) #0{
; 第二个基本块的开始
    %temp2 = call i32 @callee(i32 110) ; temp2 = callee(110)
    ret i32 %temp2 ; ret temp2
; 第二个基本块的结束
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}