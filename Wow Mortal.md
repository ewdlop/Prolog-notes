% Original titan-forged beings
titan_forged(earthen).
titan_forged(mechagnome).
titan_forged(vrykul).

% Mortal races
mortal(dwarf).
mortal(gnome).
mortal(human).

% Transformation relationships
transformed(earthen, dwarf).
transformed(mechagnome, gnome).
transformed(vrykul, human).

% Rule to determine if a being is mortal
is_mortal(X) :- transformed(_, X).
