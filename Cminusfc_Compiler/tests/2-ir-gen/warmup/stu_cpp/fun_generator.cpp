#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"

#include <iostream>
#include <memory>

#ifdef DEBUG  // 用于调试信息,大家可以在编译过程中通过" -DDEBUG"来开启这一选项
#define DEBUG_OUTPUT std::cout << __LINE__ << std::endl;  // 输出行号的简单示例
#else
#define DEBUG_OUTPUT
#endif

#define CONST_INT(num) \
    ConstantInt::get(num, module) // 得到常数值的表示,方便后面多次用到

int main()
{
    auto module = new Module();
    auto builder =new IRBuilder(nullptr,module);
    Type *Int32Type = module->get_int32_type();

    //callee函数
    // 函数参数类型的vector
    std::vector<Type *> Ints(1, Int32Type);
    auto calleeFun = Function::create(FunctionType::get(Int32Type,Ints),
                                                    "callee",module);
    auto bb = BasicBlock::create(module,"entry",calleeFun); // BasicBlock的名字在生成中无所谓,但是可以方便阅读
    builder->set_insert_point(bb);

    auto retAlloca = builder->create_alloca(Int32Type); // 在内存中分配返回值
    builder->create_store(CONST_INT(0), retAlloca); // 返回值默认为0

    DEBUG_OUTPUT

    //read params: (int a)
    std::vector<Value *> args;  // 获取callee函数的形参,通过Function中的iterator
    for (auto &arg: calleeFun->get_args()) {
        args.push_back(&arg);
    }

    //return 2*a 

    auto aAlloca = builder->create_alloca(Int32Type); // 为a分配内存
    builder->create_store(args[0],aAlloca); // 将参数a的值读取到aAlloca中
    auto aLoad = builder->create_load(aAlloca); // load a
    auto mul = builder->create_imul(aLoad, CONST_INT(2)); // 计算a*2
    builder->create_store(mul,retAlloca); //将乘积存在a2Alloca中
    
    auto retLoad = builder->create_load(retAlloca); // load retLoad
    builder->create_ret(retLoad);

    DEBUG_OUTPUT
    
    //main函数
    auto mainFun = Function::create(FunctionType::get(Int32Type,{}),
                                                    "main",module);
    bb = BasicBlock::create(module,"entry",mainFun); // BasicBlock的名字在生成中无所谓,但是可以方便阅读
    builder->set_insert_point(bb);

    retAlloca = builder->create_alloca(Int32Type); // 在内存中分配返回值
    builder->create_store(CONST_INT(0), retAlloca); // 返回值默认为0

    DEBUG_OUTPUT

    //return callee(110)

    auto call = builder->create_call(calleeFun,{CONST_INT(110)});
    builder->create_ret(call);

    DEBUG_OUTPUT

    std::cout << module->print();
    delete module;
    return 0;
}
