% Facts: Emotions, desires, and actions (七情六慾)
emotion(joy).    % 喜
emotion(anger).  % 怒
emotion(sorrow). % 哀
emotion(fear).   % 懼
emotion(love).   % 愛
emotion(hate).   % 惡
emotion(desire). % 欲

% Physical desires (六慾)
desire(sight).   % 視
desire(sound).   % 聽
desire(smell).   % 嗅
desire(taste).   % 味
desire(touch).   % 觸
desire(idea).    % 意

% Relationships and conflicts (愛恨情仇)
relationship(john, mary, love).  % John loves Mary.
relationship(mary, john, hate).  % Mary hates John.
conflict(john, mary).            % Conflict exists between John and Mary.

% Betrayal and moral struggle (紅杏出牆)
betrayal(spouse, "Affair").       % Spouse betrays through an affair.
societal_judgment("Affair", shame). % Society judges affairs as shameful.

% Transcendence (踏破紅塵)
desire_to_transcend(jane).        % Jane seeks to transcend worldly attachments.
action(jane, "Renounced worldly desires."). % Jane renounces material desires.

% Rules for emotional and moral analysis
is_emotional(X) :-
    emotion(X),
    write(X), write(' is one of the seven emotions (七情).\n').

is_physical(X) :-
    desire(X),
    write(X), write(' is one of the six desires (六慾).\n').

analyze_conflict(X, Y) :-
    relationship(X, Y, Emotion1),
    relationship(Y, X, Emotion2),
    conflict(X, Y),
    write('There is a conflict between '), write(X), write(' and '), write(Y), write(':'), nl,
    write(X), write(' feels '), write(Emotion1), write(' towards '), write(Y), write('.\n'),
    write(Y), write(' feels '), write(Emotion2), write(' towards '), write(X), write('.\n').

analyze_betrayal(Person, Action) :-
    betrayal(Person, Action),
    societal_judgment(Action, Judgment),
    write(Person), write(' committed '), write(Action), write(', which society judges as '), write(Judgment), write('.\n').

analyze_transcendence(X) :-
    desire_to_transcend(X),
    action(X, Action),
    write(X), write(' seeks transcendence by '), write(Action), write('.\n').

% Queries
% 1. Check if something is an emotion or desire:
% ?- is_emotional(joy).
% ?- is_physical(taste).

% 2. Analyze conflicts (愛恨情仇):
% ?- analyze_conflict(john, mary).

% 3. Analyze betrayal and judgment (紅杏出牆):
% ?- analyze_betrayal(spouse, "Affair").

% 4. Analyze transcendence (踏破紅塵):
% ?- analyze_transcendence(jane).
