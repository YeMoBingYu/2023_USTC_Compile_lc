#include "cminusf_builder.hpp"

#define CONST_FP(num) ConstantFP::get((float)num, module.get())
#define CONST_INT(num) ConstantInt::get(num, module.get())

// store temporary value
Value *tmp_val = nullptr;
// whether require lvalue
bool require_lvalue = false;
// function that is being built
Function *cur_fun = nullptr;
// detect scope pre-enter (for elegance only)
bool pre_enter_scope = false;
// types
Type *VOID_T;
Type *INT1_T;
Type *INT32_T;
Type *INT32PTR_T;
Type *FLOAT_T;
Type *FLOATPTR_T;
Type *INTPTRPTR_T;
Type *FLOATPTRPTR_T;

/*
 * use CMinusfBuilder::Scope to construct scopes
 * scope.enter: enter a new scope
 * scope.exit: exit current scope
 * scope.push: add a new binding to current scope
 * scope.find: find and return the value bound to the name
 */

bool promote(std::unique_ptr<IRBuilder> &builder, Value **l_val_p, Value **r_val_p)
{
    bool is_int;
    auto &l_val = *l_val_p;
    auto &r_val = *r_val_p;
    if (l_val->get_type() == r_val->get_type())
    {
        is_int = l_val->get_type()->is_integer_type();
    }
    else
    {
        is_int = false;
        if (l_val->get_type()->is_integer_type())
            l_val = builder->create_sitofp(l_val, FLOAT_T);
        else
            r_val = builder->create_sitofp(r_val, FLOAT_T);
    }
    return is_int;
}

Value *CminusfBuilder::visit(ASTProgram &node)
{
    VOID_T = module->get_void_type();
    INT1_T = module->get_int1_type();
    INT32_T = module->get_int32_type();
    INT32PTR_T = module->get_int32_ptr_type();
    FLOAT_T = module->get_float_type();
    FLOATPTR_T = module->get_float_ptr_type();
    INTPTRPTR_T = module->get_pointer_type(INT32PTR_T);
    FLOATPTRPTR_T = module->get_pointer_type(FLOATPTR_T);

    Value *ret_val = nullptr;
    for (auto &decl : node.declarations)
    {
        ret_val = decl->accept(*this);
    }
    return ret_val;
}

Value *CminusfBuilder::visit(ASTNum &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    if (node.type == TYPE_INT)
        tmp_val = CONST_INT(node.i_val);
    else
        tmp_val = CONST_FP(node.f_val);
    return nullptr;
}

Value *CminusfBuilder::visit(ASTVarDeclaration &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    Type *var_type;
    if (node.type == TYPE_INT)
        var_type = INT32_T;
    else
        var_type = FLOAT_T;
    if (node.num == nullptr)
    {
        if (scope.in_global())
        {
            auto initializer = ConstantZero::get(var_type, module.get());
            auto var = GlobalVariable::create(node.id, module.get(), var_type, false, initializer);
            scope.push(node.id, var);
        }
        else
        {
            auto var = builder->create_alloca(var_type);
            scope.push(node.id, var);
        }
    }
    else
    {
        auto *array_type = ArrayType::get(var_type, node.num->i_val);
        if (scope.in_global())
        {
            auto initializer = ConstantZero::get(array_type, module.get());
            auto var = GlobalVariable::create(node.id, module.get(), array_type, false, initializer);
            scope.push(node.id, var);
        }
        else
        {
            auto var = builder->create_alloca(array_type);
            scope.push(node.id, var);
        }
    }
    return nullptr;
}

Value *CminusfBuilder::visit(ASTFunDeclaration &node)
{
    FunctionType *fun_type;
    Type *ret_type;
    std::vector<Type *> param_types;
    if (node.type == TYPE_INT)
        ret_type = INT32_T;
    else if (node.type == TYPE_FLOAT)
        ret_type = FLOAT_T;
    else
        ret_type = VOID_T;

    for (auto &param : node.params)
    {
        // TODO: Please accomplish param_types.
        if (param->type == TYPE_INT)
        {
            if (param->isarray)
            {
                param_types.push_back(INT32PTR_T);
            }
            else
            {
                param_types.push_back(INT32_T);
            }
        }
        else
        {
            if (param->isarray)
            {
                param_types.push_back(FLOATPTR_T);
            }
            else
            {
                param_types.push_back(FLOAT_T);
            }
        }
    }

    fun_type = FunctionType::get(ret_type, param_types);
    auto func = Function::create(fun_type, node.id, module.get());
    scope.push(node.id, func);
    // context.func = func;
    cur_fun = func;
    auto funBB = BasicBlock::create(module.get(), "entry", func);
    builder->set_insert_point(funBB);
    scope.enter();
    std::vector<Value *> args;
    for (auto &arg : func->get_args())
    {
        args.push_back(&arg);
    }
    for (int i = 0; i < node.params.size(); ++i)
    {
        // TODO: You need to deal with params and store them in the scope.
        if (node.params[i]->isarray)
        {
            Value *array_alloc;
            if (node.params[i]->type == TYPE_INT)
                array_alloc = builder->create_alloca(INT32PTR_T);
            else
                array_alloc = builder->create_alloca(FLOATPTR_T);
            builder->create_store(args[i], array_alloc);
            scope.push(node.params[i]->id, array_alloc);
        }
        else
        {
            Value *alloc;
            if (node.params[i]->type == TYPE_INT)
                alloc = builder->create_alloca(INT32_T);
            else
                alloc = builder->create_alloca(FLOAT_T);
            builder->create_store(args[i], alloc);
            scope.push(node.params[i]->id, alloc);
        }
    }
    node.compound_stmt->accept(*this);
    if (not builder->get_insert_block()->is_terminated())
    {
        if (cur_fun->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (cur_fun->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));
    }
    scope.exit();
    return nullptr;
}

Value *CminusfBuilder::visit(ASTParam &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    return nullptr;
}

Value *CminusfBuilder::visit(ASTCompoundStmt &node)
{
    // TODO: This function is not complete.
    // You may need to add some code here
    // to deal with complex statements.
    bool need_exit_scope = !pre_enter_scope;
    if (pre_enter_scope)
    {
        pre_enter_scope = false;
    }
    else
    {
        scope.enter();
    }

    for (auto &decl : node.local_declarations)
    {
        decl->accept(*this);
    }

    for (auto &stmt : node.statement_list)
    {
        stmt->accept(*this);
        if (builder->get_insert_block()->is_terminated())
            break;
    }
    if (need_exit_scope)
    {
        scope.exit();
    }
    return nullptr;
}

Value *CminusfBuilder::visit(ASTExpressionStmt &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    if (node.expression != nullptr)
        node.expression->accept(*this);
    return nullptr;
}

Value *CminusfBuilder::visit(ASTSelectionStmt &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    node.expression->accept(*this);
    auto ret_val = tmp_val;
    auto trueBB = BasicBlock::create(module.get(), "", cur_fun);
    BasicBlock *falseBB;
    // auto falseBB = BasicBlock::create(module.get(), "", cur_fun);
    auto contBB = BasicBlock::create(module.get(), "", cur_fun);
    Value *cond_val;
    if (ret_val->get_type()->is_integer_type())
        cond_val = builder->create_icmp_ne(ret_val, CONST_INT(0));
    else
        cond_val = builder->create_fcmp_ne(ret_val, CONST_FP(0.));
    if (node.else_statement == nullptr)
    {
        builder->create_cond_br(cond_val, trueBB, contBB);
    }

    else
    {
        falseBB = BasicBlock::create(module.get(), "", cur_fun);
        builder->create_cond_br(cond_val, trueBB, falseBB);
    }
    builder->set_insert_point(trueBB);
    node.if_statement->accept(*this);

    // if (builder->get_insert_block()->get_terminator() == nullptr)
    if (not builder->get_insert_block()->is_terminated())
        builder->create_br(contBB);

    if (node.else_statement == nullptr)
    {
        // falseBB->erase_from_parent();
    }
    else
    {
        builder->set_insert_point(falseBB);
        node.else_statement->accept(*this);
        // if (builder->get_insert_block()->get_terminator() == nullptr)
        if (not builder->get_insert_block()->is_terminated())
            builder->create_br(contBB);
    }

    builder->set_insert_point(contBB);
    return nullptr;
}

Value *CminusfBuilder::visit(ASTIterationStmt &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    auto exprBB = BasicBlock::create(module.get(), "", cur_fun);
    // if (builder->get_insert_block()->get_terminator() == nullptr)
    if (not builder->get_insert_block()->is_terminated())
        builder->create_br(exprBB);
    builder->set_insert_point(exprBB);
    node.expression->accept(*this);
    auto ret_val = tmp_val;
    auto trueBB = BasicBlock::create(module.get(), "", cur_fun);
    auto contBB = BasicBlock::create(module.get(), "", cur_fun);
    Value *cond_val;
    if (ret_val->get_type()->is_integer_type())
        cond_val = builder->create_icmp_ne(ret_val, CONST_INT(0));
    else
        cond_val = builder->create_fcmp_ne(ret_val, CONST_FP(0.));

    builder->create_cond_br(cond_val, trueBB, contBB);
    builder->set_insert_point(trueBB);
    node.statement->accept(*this);
    // if (builder->get_insert_block()->get_terminator() == nullptr)
    if (not builder->get_insert_block()->is_terminated())
        builder->create_br(exprBB);
    builder->set_insert_point(contBB);
    return nullptr;
}

Value *CminusfBuilder::visit(ASTReturnStmt &node)
{
    if (node.expression == nullptr)
    {
        builder->create_void_ret();
        return nullptr;
    }
    else
    {
        // TODO: The given code is incomplete.
        // You need to solve other return cases (e.g. return an integer).
        auto fun_ret_type = cur_fun->get_function_type()->get_return_type();
        node.expression->accept(*this);
        if (fun_ret_type != tmp_val->get_type())
        {
            if (fun_ret_type->is_integer_type())
                tmp_val = builder->create_fptosi(tmp_val, INT32_T);
            else
                tmp_val = builder->create_sitofp(tmp_val, FLOAT_T);
        }
        builder->create_ret(tmp_val);
    }
    return nullptr;
}

Value *CminusfBuilder::visit(ASTVar &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    auto var = scope.find(node.id);
    assert(var != nullptr);
    auto is_int = var->get_type()->get_pointer_element_type()->is_integer_type();
    auto is_float = var->get_type()->get_pointer_element_type()->is_float_type();
    auto is_ptr = var->get_type()->get_pointer_element_type()->is_pointer_type();
    bool should_return_lvalue = require_lvalue;
    require_lvalue = false;
    if (node.expression == nullptr)
    {
        if (should_return_lvalue)
        {
            tmp_val = var;
            require_lvalue = false;
        }
        else
        {
            if (is_int || is_float || is_ptr)
            {
                tmp_val = builder->create_load(var);
            }
            else
            {
                tmp_val = builder->create_gep(var, {CONST_INT(0), CONST_INT(0)});
            }
        }
    }
    else
    {
        node.expression->accept(*this);
        auto val = tmp_val;
        Value *is_neg;
        auto exceptBB = BasicBlock::create(module.get(), "", cur_fun);
        auto contBB = BasicBlock::create(module.get(), "", cur_fun);
        if (val->get_type()->is_float_type())
            val = builder->create_fptosi(val, INT32_T);

        is_neg = builder->create_icmp_lt(val, CONST_INT(0));

        builder->create_cond_br(is_neg, exceptBB, contBB);
        builder->set_insert_point(exceptBB);
        auto neg_idx_except_fun = scope.find("neg_idx_except");
        builder->create_call(static_cast<Function *>(neg_idx_except_fun), {});
        if (cur_fun->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (cur_fun->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));

        builder->set_insert_point(contBB);
        Value *tmp_ptr;
        if (is_int || is_float)
            tmp_ptr = builder->create_gep(var, {val});
        else if (is_ptr)
        {
            auto array_load = builder->create_load(var);
            tmp_ptr = builder->create_gep(array_load, {val});
        }
        else
            tmp_ptr = builder->create_gep(var, {CONST_INT(0), val});
        if (should_return_lvalue)
        {
            tmp_val = tmp_ptr;
            require_lvalue = false;
        }
        else
        {
            tmp_val = builder->create_load(tmp_ptr);
        }
    }
    return nullptr;
}

Value *CminusfBuilder::visit(ASTAssignExpression &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    node.expression->accept(*this);
    auto expr_result = tmp_val;
    require_lvalue = true;
    node.var->accept(*this);
    auto var_addr = tmp_val;
    if (var_addr->get_type()->get_pointer_element_type() != expr_result->get_type())
    {
        if (expr_result->get_type() == INT32_T)
            expr_result = builder->create_sitofp(expr_result, FLOAT_T);
        else
            expr_result = builder->create_fptosi(expr_result, INT32_T);
    }
    builder->create_store(expr_result, var_addr);
    tmp_val = expr_result;
    return nullptr;
}

Value *CminusfBuilder::visit(ASTSimpleExpression &node)
{
    if (node.additive_expression_r == nullptr)
    {
        node.additive_expression_l->accept(*this);
    }
    else
    {
        node.additive_expression_l->accept(*this);
        auto l_val = tmp_val;
        node.additive_expression_r->accept(*this);
        auto r_val = tmp_val;
        bool is_int = promote(builder, &l_val, &r_val);
        Value *cmp;
        switch (node.op)
        {
        case OP_LT:
            if (is_int)
                cmp = builder->create_icmp_lt(l_val, r_val);
            else
                cmp = builder->create_fcmp_lt(l_val, r_val);
            break;
        case OP_LE:
            if (is_int)
                cmp = builder->create_icmp_le(l_val, r_val);
            else
                cmp = builder->create_fcmp_le(l_val, r_val);
            break;
        case OP_GE:
            if (is_int)
                cmp = builder->create_icmp_ge(l_val, r_val);
            else
                cmp = builder->create_fcmp_ge(l_val, r_val);
            break;
        case OP_GT:
            if (is_int)
                cmp = builder->create_icmp_gt(l_val, r_val);
            else
                cmp = builder->create_fcmp_gt(l_val, r_val);
            break;
        case OP_EQ:
            if (is_int)
                cmp = builder->create_icmp_eq(l_val, r_val);
            else
                cmp = builder->create_fcmp_eq(l_val, r_val);
            break;
        case OP_NEQ:
            if (is_int)
                cmp = builder->create_icmp_ne(l_val, r_val);
            else
                cmp = builder->create_fcmp_ne(l_val, r_val);
            break;
        }

        tmp_val = builder->create_zext(cmp, INT32_T);
    }
    return nullptr;
}

Value *CminusfBuilder::visit(ASTAdditiveExpression &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    if (node.additive_expression == nullptr)
    {
        node.term->accept(*this);
    }
    else
    {
        node.additive_expression->accept(*this);
        auto l_val = tmp_val;
        node.term->accept(*this);
        auto r_val = tmp_val;
        bool is_int = promote(builder, &l_val, &r_val);
        switch (node.op)
        {
        case OP_PLUS:
            if (is_int)
                tmp_val = builder->create_iadd(l_val, r_val);
            else
                tmp_val = builder->create_fadd(l_val, r_val);
            break;
        case OP_MINUS:
            if (is_int)
                tmp_val = builder->create_isub(l_val, r_val);
            else
                tmp_val = builder->create_fsub(l_val, r_val);
            break;
        }
    }
    return nullptr;
}

Value *CminusfBuilder::visit(ASTTerm &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    if (node.term == nullptr)
    {
        node.factor->accept(*this);
    }
    else
    {
        node.term->accept(*this);
        auto l_val = tmp_val;
        node.factor->accept(*this);
        auto r_val = tmp_val;
        bool is_int = promote(builder, &l_val, &r_val);
        switch (node.op)
        {
        case OP_MUL:
            if (is_int)
                tmp_val = builder->create_imul(l_val, r_val);
            else
                tmp_val = builder->create_fmul(l_val, r_val);
            break;
        case OP_DIV:
            if (is_int)
                tmp_val = builder->create_isdiv(l_val, r_val);
            else
                tmp_val = builder->create_fdiv(l_val, r_val);
            break;
        }
    }
    return nullptr;
}

Value *CminusfBuilder::visit(ASTCall &node)
{
    // TODO: This function is empty now.
    // Add some code here.
    auto fun = static_cast<Function *>(scope.find(node.id));
    std::vector<Value *> args;
    auto param_type = fun->get_function_type()->param_begin();
    for (auto &arg : node.args)
    {
        arg->accept(*this);
        if (!tmp_val->get_type()->is_pointer_type() &&
            *param_type != tmp_val->get_type())
        {
            if (tmp_val->get_type()->is_integer_type())
                tmp_val = builder->create_sitofp(tmp_val, FLOAT_T);
            else
                tmp_val = builder->create_fptosi(tmp_val, INT32_T);
        }
        args.push_back(tmp_val);
        param_type++;
    }

    tmp_val = builder->create_call(static_cast<Function *>(fun), args);
    return nullptr;
}
