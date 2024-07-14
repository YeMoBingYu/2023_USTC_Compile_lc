#include "Dominators.hpp"

void Dominators::run()
{
    for (auto &f1 : m_->get_functions())
    {
        auto f = &f1;
        if (f->get_basic_blocks().size() == 0)
            continue;
        for (auto &bb1 : f->get_basic_blocks())
        {
            auto bb = &bb1;
            std::set<BasicBlock *> bb_set;
            dom_frontier_.insert(std::make_pair(bb, bb_set));
        }
        create_dominance_frontier(f);
    }
}

void Dominators::create_dominance_frontier(Function *f)
{
    for (auto &bb1 : f->get_basic_blocks())
    {
        auto bb = &bb1;
        auto &pre_bb_list = bb->get_pre_basic_blocks();
        if (pre_bb_list.size() > 1)
        {
            for (auto &pre_bb : pre_bb_list)
            {
                if (dom_frontier_.find(pre_bb) == dom_frontier_.end())
                {
                    std::set<BasicBlock *> pre_bb_set;
                    dom_frontier_.insert(std::make_pair(pre_bb, pre_bb_set));
                }
                dom_frontier_[pre_bb].insert(bb);
            }
        }
    }
}


