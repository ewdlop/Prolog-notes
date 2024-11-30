% 定義社交攀附者
% social_climber(Person) 表示 Person 是社交攀附者
social_climber(Person) :-
    seeks_higher_social_status(Person),
    associates_with_higher_status_individuals(Person),
    exhibits_obsequious_behavior(Person).
