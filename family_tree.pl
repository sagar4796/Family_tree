male(sagar).
male(jatin).
male(bharat).
male(kishor).
male(dhruv).
male(mohan).
male(raghav).
female(bhavna).
female(liza).
female(sangita).
female(lila).
female(krinal).
female(mani).
parent(bharat,sagar).
parent(bharat,jatin).
parent(bhavna,sagar).
parent(bhavna,jatin).
parent(kishor,liza).
parent(kishor,dhruv).
parent(sangita,liza).
parent(sangita,dhruv).
parent(mohan,bharat).
parent(mohan,kishor).
parent(lila,bharat).
parent(lila,kishor).
parent(raghav,mohan).
parent(mani,mohan).
husband(bharat,bhavna).
husband(kishor,sangita).
husband(jatin,krinal).
husband(mohan,lila).
husband(raghav,mani).
wife(bhavna,bharat).
wife(sangita,kishor).
wife(krinal,jatin).
wife(lila,mohan).
wife(mani,raghav).
father(X,Y):- parent(X,Y),male(X).
mother(X,Y):- parent(X,Y) ,female(X).
brother(X,Y):-father(Z,X),father(Z,Y), male(X), not(X=Y).
sister(X,Y):- female(X), father(Z,X),father(Z,Y), not(X=Y).
grandfather(X,Y):- male(X), father(X,Z), father(Z,Y).
grandmother(X,Y):- female(X), mother(X,Z), father(Z,Y).
son(X,Y):-male(X), parent(Y,X).
daughter(X,Y):- female(X), parent(Y,X).
grandson(X,Y):- male(X), father(Z,X), son(Z,Y).
granddaughter(X,Y):- female(X), father(Z,X), son(Z,Y).
uncle(X,Y):- father(Z,Y), brother(X,Z).
auntie(X,Y):-father(Z,Y),brother(W,Z), wife(X,W).
sibling(X,Y):-father(Z,X), father(Z,Y), not(X=Y).
cousin(X,Y):-uncle(Z,X), father(Z,Y).
cousin_brother(X,Y):- male(X),uncle(Z,X), father(Z,Y).
cousin_sister(X,Y):-female(X),uncle(Z,X), father(Z,Y).
sister_in_law(X,Y):-wife(X,Z),brother(Z,Y).
sister_in_law(X,Y):-wife(X,Z),cousin(Z,Y).
sister_in_law(X,Y):-sister(X,Z),husband(Z,Y).
sister_in_law(X,Y):-cousin_sister(X,Z),husband(Z,Y).
sister_in_law(X,Y):-sister(X,Z),wife(Z,Y).
sister_in_law(X,Y):-cousin_sister(X,Z),wife(Z,Y).
brother_in_law(X,Y):-brother(X,Z),husband(Z,Y).
brother_in_law(X,Y):-brother(X,Z),wife(Z,Y).
brother_in_law(X,Y):-cousin_brother(X,Z),husband(Z,Y).
brother_in_law(X,Y):-cousin_brother(X,Z),wife(Z,Y).
brother_in_law(X,Y):-husband(X,Z),cousin(Z,Y).
brother_in_law(X,Y):-husband(X,Z),sister(Z,Y).
father_in_law(X,Y):-father(X,Z),husband(Z,Y).
father_in_law(X,Y):-father(X,Z),wife(Z,Y).
mother_in_law(X,Y):-mother(X,Z),husband(Z,Y).
mother_in_law(X,Y):-mother(X,Z),wife(Z,Y).
uncle_in_law(X,Y):- uncle(X,Z), husband(Z,Y).
uncle_in_law(X,Y):- uncle(X,Z), wife(Z,Y).
auntie_in_law(X,Y):- auntie(X,Z), husband(Z,Y).
auntie_in_law(X,Y):- auntie(X,Z), wife(Z,Y).
daughter_in_law(X,Y):-wife(X,Z),son(Z,Y).
son_in_law(X,Y):-husband(X,Z),daughter(Z,Y).
grand_daughter_in_law(X,Y):-wife(X,Z),grandson(Z,Y).
grand_son_in_law(X,Y):-husband(X,Z),granddaughter(Z,Y).
nephew(X,Y):-father(Z,X),brother(Z,Y).
nephew(X,Y):-father(Z,X),brother_in_law(Z,Y).
nephew_in_law(X,Y):-wife(X,Z),nephew(Z,Y).
nephew_in_law(X,Y):-husband(X,Z),nephew(Z,Y).
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z), ancestor(Z,Y).
descendant(X,Y):-parent(Y,X).
descendant(X,Y):-parent(Z,X), descendant(Z,Y).