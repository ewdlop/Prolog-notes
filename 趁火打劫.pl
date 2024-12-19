% 定义谓词：趁火打劫
% 参数：掠夺者，受害者，受害者所处的困境
chenhuodaijie(Person, Victim, Crisis) :-
    crisis(Victim, Crisis),
    exploit(Person, Victim, Crisis).

% 示例事实：受害者处于困境
crisis(zhangsan, house_on_fire).

% 示例事实：某人利用他人困境进行掠夺
exploit(lisi, zhangsan, house_on_fire).
