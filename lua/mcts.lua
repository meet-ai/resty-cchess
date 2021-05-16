--- ActionState 某个 step 方法的得分
--move_lookup = require("move_lookup")
senv = require("env")
module("mcts", package.seeall);

ActionState = {n=0,w=0,q=0,p=0}


-- 某个局面整体总体得分, 一个局面包含许多子局面和走法
VisitState = {                  -- visit state 表示的是一个局面对应的 走法和得分
    action_state_dict = {},-- key: action, value: ActionState , 0205:{0,0,0,0}
    sum_n = 0 ,                  -- visit count
    visit = {},                   -- thread id that has visited this state
    policy = Nil,                     -- policy of this state
    legal_moves = Nil,           -- all leagal moves of this state
    waiting = false,              -- is waiting for NN's predict
    w = 0
}

-- 计算下一步走法策略
local state_tree={};

function init()
    return self;
end


function cal_policy(state) 
   --分析 N 个局面之后, 计算每个走法的 max_q 值
   -- 问题? visit_state 里面是只包含了可以走的方法, 更深的走法是不是会被忽略掉
   -- calculate π(a|s0) according to the visit count --
   --visit_tree_node = self.state_tree[state]
   --policy = np.zeros(self.labels_n)
   --debug_result = {}

   --for mov, action_state in visit_tree_node.action_state_dict.items():
   --    policy[self.move_lookup[mov]] = action_state.n
   --    if no_act and mov in no_act:
   --        policy[self.move_lookup[mov]] = 0
   --        continue
   --    if self.debugging:
   --        debug_result[mov] = (action_state.n, action_state.q, action_state.p)
   --    if action_state.q > max_q_value:
   --        max_q_value = action_state.q
-- --  if max_q_value < self.play_config.resign_threshold and self.enable_resign and turns > self.play_config.min_resign_turn:
-- --      return policy, True
   --policy /= np.sum(policy)
   --return policy, False
   print("call cal policy")
end

function action(state)
    if state_tree==nil or state_tree[state] == nil then
         print("not contain")
         print(cal_policy)
         search(state)
         policy_np =  cal_policy(state)
         
    end
end


function search(state)
    if senv.game_over() then
        print("game over")
        return 
    end
    print("game search")

--        while True:
--            # logger.debug(f"start MCTS, state = {state}, history = {history}")
--            -- game_over, v, _ = senv.done(state)
--            -- if game_over:
--            --     v = v * 2
--            --     self.executor.submit(self.update_tree, None, v, history)
--            --     break
--            -- check need stop
--            
--
--            with self.node_lock[state]:
--                if state not in self.tree:
--                    # Expand and Evaluate
--                    self.tree[state].sum_n = 1
--                    self.tree[state].legal_moves = senv.get_legal_moves(state)
--                    self.tree[state].waiting = True
--                    # logger.debug(f"expand_and_evaluate {state}, sum_n = {self.tree[state].sum_n}, history = {history}")
--                    if is_root_node and real_hist:
--                        self.expand_and_evaluate(state, history, real_hist)
--                    else:
--                        self.expand_and_evaluate(state, history)
--                    break
--
--                if state in history[:-1]: # loop
--                    for i in range(len(history) - 1):
--                        if history[i] == state:
--                            if senv.will_check_or_catch(state, history[i+1]):
--                                self.executor.submit(self.update_tree, None, -1, history)
--                            elif senv.be_catched(state, history[i+1]):
--                                self.executor.submit(self.update_tree, None, 1, history)
--                            else:
--                                # logger.debug(f"loop -> loss, state = {state}, history = {history[:-1]}")
--                                self.executor.submit(self.update_tree, None, 0, history)
--                            break
--                    break
--
--                # Select
--                node = self.tree[state]
--                if node.waiting:
--                    node.visit.append(history)
--                    # logger.debug(f"wait for prediction state = {state}")
--                    break
--
--                sel_action = self.select_action_q_and_u(state, is_root_node)
--
--                virtual_loss = self.config.play.virtual_loss
--                self.tree[state].sum_n += 1
--                # logger.debug(f"node = {state}, sum_n = {node.sum_n}")
--                
--                action_state = self.tree[state].a[sel_action]
--                action_state.n += virtual_loss
--                action_state.w -= virtual_loss
--                action_state.q = action_state.w / action_state.n
--
--                # logger.debug(f"apply virtual_loss = {virtual_loss}, as.n = {action_state.n}, w = {action_state.w}, q = {action_state.q}")
--                
--                # if action_state.next is None:
--                history.append(sel_action)
--                state = senv.step(state, sel_action)
--                history.append(state)
end
