edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,f).
edge(c,g).

dfs(Start, End, Path):- 
    dfs_recursive(Start, End, [Start], Path).

dfs_recursive(End, End, Visited, Path):-
    reverse(Visited, Path).

dfs_recursive(Curr, End, Visited, Path):-
    edge(Curr, Next),
    \+member(Next, Visited),
    dfs_recursive(Next, End, [Next|Visited], Path).


bfs(Start, End, Path) :- 
    bfs_queue([[Start]], End, RevPath),
    reverse(RevPath, Path).

bfs_queue([[End|Rest]| _], End, [End|Rest]).

bfs_queue([[Curr|Rest]|Paths], End, Path) :-
    findall(Next, edge(Curr, Next), Neighbors),
    findall([Next,Curr|Rest], member(Next,Neighbors),NewPaths), 
    append(Paths, NewPaths, MorePaths),
    bfs_queue(MorePaths, End, Path).
