% We can express the solution as a list in the form:
% Sol = [[Color,Nationality,Candy,Drink,Pet],[..],[..],[..],[..]].
%
% ?- solve(Sol).
% Sol = [[yellow,norwegian,kitkat,   water, fox   ],
%        [blue,  ukranian, hershey,  tea,   horse ],
%        [red,   english,  smarties, milk,  snails],
%        [ivory, spanish,  snickers, oj,    dog   ],
%        [green, japanese, milkyway, coffee,zebra ]] ;
% false.

% Y is to the right of X in the list
right(X,Y,[X,Y|_]).
right(X,Y,[_H|T]) :- right(X,Y,T).

% X and Y are next to each other in the list
next(X,Y,L) :- right(X,Y,L).
next(X,Y,L) :- right(Y,X,L).

% Rules 3 and 14 are brought to the front to speed up the search.
solve(Sol):-
    Sol = [[_,norwegian,_,_,_],_,_,_,_],          %  3
    Sol = [_,_,[_,_,_,milk,_],_,_],               % 14
    member([red,english,_,_,_],Sol),              %  1
    member([_,spanish,_,_,dog],Sol),              %  2
    right([ivory,_,_,_,_],[green,_,_,_,_],Sol),   %  4
    next([_,_,hershey,_,_],[_,_,_,_,fox],Sol),    %  5
    member([yellow,_,kitkat,_,_],Sol),            %  6
    next([_,norwegian,_,_,_],[blue,_,_,_,_],Sol), %  7
    member([_,_,smarties,_,snails],Sol),          %  8
    member([_,_,snickers,oj,_],Sol),              %  9
    member([_,ukranian,_,tea,_],Sol),             % 10
    member([_,japanese,milkyway,_,_],Sol),        % 11
    next([_,_,kitkat,_,_],[_,_,_,_,horse],Sol),   % 12
    member([green,_,_,coffee,_],Sol),             % 13
    member([_,_,_,water,_],Sol),  % someone drinks water
    member([_,_,_,_,zebra],Sol).  % someone has a zebra

% For solutions to similar puzzles, see:
% www.anselm.edu/internet/compsci/faculty_staff/mmalita/HOMEPAGE/logic