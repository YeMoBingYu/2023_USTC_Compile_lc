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

#define CONST_FP(num) \
    ConstantFP::get(num, module) // 得到常数值的表示,方便后面多次用到

int main()
{
    auto module = new Module();
    auto builder =new IRBuilder(nullptr,module);
    Type *Int32Type = module->get_int32_type();
    
    //main函数
    auto mainFun = Function::create(FunctionType::get(Int32Type,{}),
                                                    "main",module);
    auto bb = BasicBlock::create(module,"entry",mainFun); // BasicBlock的名字在生成中无所谓,但是可以方便阅读
    builder->set_insert_point(bb);

    auto retAlloca = builder->create_alloca(Int32Type); // 在内存中分配返回值
    builder->create_store(CONST_INT(0), retAlloca); // 返回值默认为0
    auto retLoad = builder->create_load(retAlloca); //load retLoad

    DEBUG_OUTPUT

    //float a=5.555
    auto aAlloca = builder->create_alloca(module->get_float_type()); // 在内存中为a分配空间
    builder->create_store(CONST_FP(5.555), aAlloca); // store 5.555 in a

    //if(a>1)
    auto trueBB = BasicBlock::create(module,"in_if",mainFun); // in_if 分支
    auto falseBB = BasicBlock::create(module,"after_if",mainFun); // after_if 分支
    auto aLoad = builder->create_load(aAlloca); //load aLoad
    auto fcmp = builder->create_fcmp_gt(aLoad, CONST_FP(1)); // compare a>1
    auto br = builder->create_cond_br(fcmp, trueBB, falseBB);

    //return 233
    builder->set_insert_point(trueBB); // trueBB 分支

    builder->create_store(CONST_INT(233),retAlloca); // store 233 in retAlloca
    retLoad = builder->create_load(retAlloca); // load retLoad
    builder->create_ret(retLoad); //return retLoad

    DEBUG_OUTPUT

    //return 0
    builder->set_insert_point(falseBB); // falseBB分支

    retLoad = builder->create_load(retAlloca); // load a[1]
    builder->create_ret(retLoad); // return retLoad

    DEBUG_OUTPUT

    std::cout << module->print();
    delete module;
    return 0;
}
