/** Predicates */
nameOf("Jonas Kahnwald", jonas).
nameOf("Michael Kahnwald", mikkel).
nameOf("Ines Kahnwald", ines).
nameOf("Daniel Kahnwald", daniel).
nameOf("Sebastian Krüger", sebastian).
nameOf("Hannah Kahnwald", hannah).
nameOf("Noah", noah).
nameOf("Agnes Nielsen", agnes).
nameOf("Jana Nielsen", jana).
nameOf("Tronte Nielsen", tronte).
nameOf("Katharina Nielsen", katharina).
nameOf("Ulrich Nielsen", ulrich).
nameOf("Martha Nielsen", martha).
nameOf("Magnus Nielsen", magnus).
nameOf("Mads Nielsen", mads).
nameOf("Doris Tiedemann", drois).
nameOf("Egon Tiedemann", egon).
nameOf("Claudia Tiedemann", claudia).
nameOf("Aleksander Tiedemann", aleksander).
nameOf("Regina Tiedemann", regina).
nameOf("Bartosz Tiedemann", bartosz).
nameOf("H.G. Tannhaus", tannhaus).
nameOf("Charlotte Doppler", charlotte).
nameOf("Greta Doppler", greta).
nameOf("Elisabeth Doppler", charlotte).
nameOf("Bernd Doppler", bernd).
nameOf("Helge Doppler", helge).
nameOf("Peter Doppler", peter).
nameOf("Franziska Doppler", franziska).

male(jonas).
male(daniel).
male(sebastian).
male(ulrich).
male(magnus).
male(mads).
male(tronte).
male(noah).
male(egon).
male(aleksander).
male(bartosz).
male(tannhaus).
male(peter).
male(helge).
male(bernd).
male(mikkel).

female(hannah).
female(ines).
female(katharina).
female(martha).
female(jana).
female(agnes).
female(claudia).
female(regina).
female(doris).
female(charlotte).
female(elisabeth).
female(franziska).
female(greta).

inLove(hannah, ulrich).
inLove(martha, jonas).
inLove(martha, bartosz).
inLove(franziska, magnus).
inLove(agnes, doris).
inLove(claudia, tronte).

inLove(X, Y) :- parentOf(X, Z), parentOf(Y, Z), X \== Y.
inLove(X, Y) :- inLove(Y, X).

parentOf(mikkel, jonas).
parentOf(hannah, jonas).

parentOf(ines, mikkel).

parentOf(sebastian, hannah).

parentOf(katharina, mikkel).
parentOf(ulrich, mikkel).

parentOf(katharina, martha).
parentOf(ulrich, martha).

parentOf(katharina, magnus).
parentOf(ulrich, magnus).

parentOf(jana, ulrich).
parentOf(tronte, ulrich).

parentOf(jana, mads).
parentOf(tronte, mads).

parentOf(agnes, tronte).

parentOf(doris, claudia).
parentOf(egon, claudia).

parentOf(claudia, regina).

parentOf(aleksander, bartosz).
parentOf(regina, bartosz).

parentOf(charlotte, elisabeth).
parentOf(peter, elisabeth).

parentOf(charlotte, franziska).
parentOf(peter, franziska).

parentOf(noah, charlotte).
parentOf(elisabeth, charlotte).

parentOf(greta, helge).
parentOf(bernd, helge).

parentOf(unknown1, noah).
parentOf(unknown1, agnes).

parentOf(unknown2, tannhaus).
parentOf(unknown2, charlotte).

/** Rules */
childOf(Child, Parent) :- parentOf(Parent, Child).
grandParentOf(Grandparent, Grandchild) :- parentOf(Grandparent, Parent), parentOf(Parent, Grandchild).
grandMotherOf(Grandmother, Grandchild) :- grandParentOf(Grandmother, Grandchild), female(Grandmother).
grandFatherOf(Grandfather, Grandchild) :- grandParentOf(Grandfather, Grandchild), male(Grandfather).
grandChildOf(Grandchild, Grandparent) :- grandParentOf(Grandparent, Grandchild).

ancestorOf(Ancestor, X) :- parentOf(Ancestor, X).
ancestorOf(Ancestor, X) :- ancestorOf(Y, X), parentOf(Ancestor, Y).

circle(X) :- ancestorOf(X, X).

motherOf(Mother, Child) :- parentOf(Mother, Child), female(Mother).
fatherOf(Father, Child) :- parentOf(Father, Child), male(Father).
daughterOf(Parent, Daughter) :- childOf(Daughter, Parent), female(Daughter).
sonOf(Parent, Son) :- childOf(Son, Parent), male(Son).

siblingOf(X, Y) :- parentOf(Z, X), parentOf(Z, Y), X \== Y.
sisterOf(Sister, Sibling) :- siblingOf(Sister, Sibling), female(Sister).
brotherOf(Brother, Sibling) :- siblingOf(Brother, Sibling), male(Brother).

auntOf(Aunt, X) :- parentOf(Parent, X), sisterOf(Aunt, Parent).
uncleOf(Uncle, X) :- parentOf(Parent, X), brotherOf(Uncle, Parent).
cousinOf(Cousin, X) :- auntOf(Aunt, X), childOf(Cousin, Aunt); uncleOf(Uncle, X), childOf(Cousin, Uncle).
