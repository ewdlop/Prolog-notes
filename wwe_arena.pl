% 事實定義
% 人物和行為
person(john).
person(mary).
person(paul).

% 行為：提供刀與殺人
gave_knife(john, paul).  % John把刀給了Paul
killed(paul, mary).      % Paul用刀殺了Mary

% 規則定義
% 判斷接刀殺人的責任
% responsible(X, Y) :- 
    %gave_knife(X, Z), 
    %killed(Z, Y), 
    %X \= Z.  % X不是直接殺人者，但有提供工具的責任

% 查詢是否有人對Mary的死亡負責
%?- responsible(X, mary)



% 事實定義
% 人物和行為
person(cilent).
person(hitman).
person(paul).

% 行為：提供刀與殺人
gave_knife(hitman,cilent).  % John把刀給了Paul
killed(paul, hitman).      % Paul用刀殺了Mary

% 判斷是否是殺手
is_hitman(mary) :- killed(paul, mary).  % 如果Paul殺了Mary，則Mary是目標。

?- is_hitman(mary) %someone lied?

