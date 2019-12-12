# Brooklin 99 islanders riddle
 A brain teaser posed by the character Captain Ray Holt of 'Brooklyn Nine-Nine' played by Andre Braugher during episode 18 of season 2, solved with Scheme
 
Ray Holt :
~~~~
"There are twelve men on an island, eleven weigh exactly the same amount, but one of them is slightly lighter or heavier, you must figure out which.
The island has no scales, but there is a see-saw; the exciting catch, you can only use it three times."
~~~~

The solution in discoursive form (from https://puzzling.stackexchange.com/questions/15426/brooklyn-nine-nine-riddle-weighing-islanders?fbclid=IwAR1Vcym4hFkBW4_QMG2oJHkbAwg4Gw9ZoYJjbVqahhrQYk9zojq-k3zPI9Q):
~~~~
Number the men 1,2,3...12. First weigh 1,2,3,4 against 5,6,7,8. One of two things will happen:

1) They are equal. Now we know that the different man is among {9,10,11,12}. Weigh 9,10,11 against 1,2,3. If these are equal, the different man is 12. Weigh 12 against 1 to find out whether 12 is heaver or lighter. If the 9,10,11 differs from 1,2,3, then weigh 9 against 10. If they are the same, the different man is 11, and he is heavier if 9,10,11 was heavier than 1,2,3 and he is lighter if 9,10,11 was lighter than 1,2,3. If 9 and 10 are different, the different man is the lighter of the 9,10 comparison if 9,10,11 was lighter than 1,2,3, (and he is lighter); the different man is the heavier of the 9,10 comparison if 9,10,11 was heavier than 1,2,3 (and he is heavier).

2) They are different. Without loss of generality suppose that 1,2,3,4 is heavier than 5,6,7,8. (We could always relabel the men so that this is true). We know {9,10,11,12} all weigh the same.

Weigh 1,2,5,6,7 against 8,9,10,11,12:

a) If 1,2,5,6,7 is heavier, then either 1 or 2 heavier, or 8 is lighter. Weigh 1 against 2. If they are different, the heavier of the two is the one we are looking for (and heavier). If they are the same, 8 is the one we are looking for (and lighter).

b) If 1,2,5,6,7 is lighter, then one of 5,6,7 is different and lighter. Weigh 5 against 6. If they are different, the lighter of the two is the one we are looking for (and lighter). If they are the same, 7 is different (and lighter).

c) If they are the same, then one of 3,4 is different. Weigh them against each other. The one who is heavier is the different man (and heavier).
~~~~

## Usage:
* `(load "brooklin-99.scm")` will find the different islander form the builtin list `pp`
* Once the program is running you can "find the different islander" from any list from the REPL:
`(do-dat-thing your-list)`
The list must contain 12 elements, only one owhich can be different from all the others.
There is no checking for now :)
