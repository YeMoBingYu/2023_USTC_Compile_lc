; .ll文件中注释以';'开头
; ModuleID = 'assign.c'
source_filename = "assign.c"
; target的开始
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; 全局main函数的定义
; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0{
; 第一个基本块的开始
    %a = alloca [10 x i32] ; int a[10]
    %a0_ptr = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 0 ; get a[0] address
    store i32 10, i32* %a0_ptr ; store a[0]=10
    %a1_ptr = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 1 ; get a[1] address
    %a0 = load i32, i32* %a0_ptr ; load a[0]
    %temp = mul i32 %a0, 2 ; a[1]=a[0]*2
    store i32 %temp, i32* %a1_ptr ; store a[1]
    %a1 = load i32, i32* %a1_ptr ; load a[1]
    ret i32 %a1
; 第一个基本块的结束
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}