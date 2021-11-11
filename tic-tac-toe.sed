#!/usr/bin/sed -Enf

# key map
/^$/b print
/^r/b print
/^q/q
/^1/b pre1
/^2/b pre2
/^3/b pre3
/^4/b pre4
/^5/b pre5
/^6/b pre6
/^7/b pre7
/^8/b pre8
/^9/b pre9
/^/d
b end

:print
g
s/.*/\
Current player: X\
(1) | (2) | (3)\
(4) | (5) | (6)\
(7) | (8) | (9)\
/
b end

:check_win
# check win with any row
/ X  \|  X  \|  X/b x_won
/ O  \|  O  \|  O/b o_won
# the first column
/ X.{13}\
 X.{13}\
 X/b x_won
/ O.{13}\
 O.{13}\
 O/b x_won
# the second column
/.{7}X.{7}\
.{7}X.{7}\
.{7}X.{7}/b x_won
/.{7}O.{7}\
.{7}O.{7}\
.{7}O.{7}/b o_won
# the third column
/.{13}X \
.{13}X \
.{13}X/b x_won
/.{13}O \
.{13}O \
.{13}O/b o_won
# main diagonal
/ X.{13}\
.{7}X.{7}\
.{13}X/b x_won
/ O.{13}\
.{7}O.{7}\
.{13}O/b x_won
# idk the name of the diagonal in English
/.{13}X \
.{7}X.{7}\
 X/b x_won
/.{13}O \
.{7}O.{7}\
 O/b o_won
b end

:pre1
g
/(1)/!b end 
/Current player: X/b place1X
/Current player: O/b place1O

:place1X
s/\(1\)/ X /g
s/Current player: X/Current player: O/
b check_win

:place1O
s/\(1\)/ O /g
s/Current player: O/Current player: X/
b check_win

:pre2
g
/(2)/!b end 
/Current player: X/b place2X
/Current player: O/b place2O

:place2X
s/\(2\)/ X /g
s/Current player: X/Current player: O/
b check_win

:place2O
s/\(2\)/ O /g
s/Current player: O/Current player: X/
b check_win

:pre3
g
/(3)/!b end 
/Current player: X/b place3X
/Current player: O/b place3O

:place3X
s/\(3\)/ X /g
s/Current player: X/Current player: O/
b check_win

:place3O
s/\(3\)/ O /g
s/Current player: O/Current player: X/
b check_win

:pre4
g
/(4)/!b end 
/Current player: X/b place4X
/Current player: O/b place4O

:place4X
s/\(4\)/ X /g
s/Current player: X/Current player: O/
b check_win

:place4O
s/\(4\)/ O /g
s/Current player: O/Current player: X/
b check_win

:pre5
g
/\(5\)/!b end 
/Current player: X/b place5X
/Current player: O/b place5O

:place5X
s/\(5\)/ X /g
s/Current player: X/Current player: O/
b check_win

:place5O
s/\(5\)/ O /g
s/Current player: O/Current player: X/
b check_win

:pre6
g
/(6)/!b end 
/Current player: X/b place6X
/Current player: O/b place6O

:place6X
s/\(6\)/ X /g
s/Current player: X/Current player: O/
b check_win

:place6O
s/\(6\)/ O /g
s/Current player: O/Current player: X/
b check_win

:pre7
g
/(7)/!b end 
/Current player: X/b place7X
/Current player: O/b place7O

:place7X
s/\(7\)/ X /g
s/Current player: X/Current player: O/
b check_win

:place7O
s/\(7\)/ O /g
s/Current player: O/Current player: X/
b check_win

:pre8
g
/(8)/!b end 
/Current player: X/b place8X
/Current player: O/b place8O

:place8X
s/\(8\)/ X /g
s/Current player: X/Current player: O/
b check_win

:place8O
s/\(8\)/ O /g
s/Current player: O/Current player: X/
b check_win

:pre9
g
/(9)/!b end 
/Current player: X/b place9X
/Current player: O/b place9O

:place9X
s/\(9\)/ X /g
s/Current player: X/Current player: O/
b check_win

:place9O
s/\(9\)/ O /g
s/Current player: O/Current player: X/
b check_win

:x_won
/x_won$/ !{
	s/$/x_won/
}
b end

:o_won
/o_won$/ !{
	s/$/o_won/
}
b end

:end
# save changes to hold buffer and process post-effects
h

:test
i\
[H
/x_won$/ {
	s/x_won$/X player won the game!\n/
	p;q
}
/o_won$/ {
	s/o_won$/O player won the game!/
	p;q
}
p
