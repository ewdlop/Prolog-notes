/* 
  This Prolog knowledge base models course prerequisites and eligibility rules.

  - Each `course(C)` fact declares a course C exists.
  - Each `prereq(C, P)` fact means course C requires P as a prerequisite (P must be taken before C).
    (We assume all listed prerequisites are mandatory; no alternative "either/or" prerequisites are encoded.)
  - The `eligible(Course, CompletedCourses)` rule is true if every prerequisite of `Course` is in the `CompletedCourses` list.
    It uses negation to ensure no required prereq is missing from the student's completed list.

  By querying `eligible/2`, we can check if a student with a given set of completed courses can enroll in a specific course.
  We can also find which courses become available given a set of completed courses.
*/

% List of courses offered in the curriculum
course(cs100).  % Introduction to Computing
course(cs101).  % Introduction to Programming
course(cs102).  % Data Structures
course(cs103).  % Computer Systems Fundamentals
course(cs201).  % Algorithms (advanced course)
course(cs210).  % Advanced Topics in CS

% Prerequisite facts: prereq(Course, Prerequisite).
% Each fact indicates the second course is a prerequisite for the first.
prereq(cs101, cs100).   % CS101 requires CS100
prereq(cs102, cs101).   % CS102 requires CS101
prereq(cs103, cs101).   % CS103 requires CS101
prereq(cs201, cs102).   % CS201 requires CS102
prereq(cs201, cs103).   % CS201 requires CS103 (so CS201 needs both CS102 and CS103)
prereq(cs210, cs201).   % CS210 requires CS201

% Helper: check membership of an element in a list (if not using Prolog's built-in member/2).
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

% Rule: A student is eligible for Course if all prerequisites of Course are in their CompletedCourses list.
eligible(Course, CompletedCourses) :-
    course(Course),  % ensure Course is a known course
    \+ ( prereq(Course, P),        % find a prerequisite P of Course ...
         \+ member(P, CompletedCourses)   % ... that the student has NOT completed
       ).
% The logic above says: there is NO prerequisite P of the Course such that P is not in CompletedCourses.
% In other words, every prerequisite P must be present in CompletedCourses for eligible/2 to succeed.

% Example Queries:
% ?- eligible(cs101, [cs100]).
%    true.    % Student who took cs100 is eligible for cs101.
%
% ?- eligible(cs102, [cs100, cs101]).
%    true.    % Eligible for cs102 because cs101 (its prereq) is done.
%
% ?- eligible(cs201, [cs100, cs101, cs102]).
%    false.   % Not eligible for cs201, since cs103 is also required but not taken.
%
% ?- eligible(cs201, [cs100, cs101, cs102, cs103]).
%    true.    % Now eligible for cs201, as all prerequisites (cs102 and cs103) are completed.
%
% You can also ask Prolog to find all courses available given some completed list, for example:
% ?- eligible(C, [cs100, cs101]).
%    C = cs102 ;
%    C = cs103.
% This query finds that after cs100 and cs101, the student can take cs102 and cs103.
