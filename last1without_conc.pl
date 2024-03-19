last1(Item, [Item]). % Base case: Item is the last element of a list with a single element.
last1(Item, [_|Rest]) :- % Recursive case: Ignore the first element and check the rest of the list.
    last1(Item, Rest).
