If the `or` function is evaluated using applicative-order like any other procedure then the following code will lead to an infinite recursive call.

 ``(define (p) (p))
    (or #f #t (p))``

However, if `or` simply returns a value of true in the above program then we can be sure that `(p)` was not called because the program did not freeze. This allows us to deduce that `or` evaluates its arguments from left to right and stops as soon as it encounters a value of true. This conclusion can be made even more certain if we run the program below. 

  ``(or (p) #t #f)``

If the program above freezes then we can be sure that `(p)` was indeed evaluated and this led to an infinite recursive call, cementing our conclusion.


Just as we tested how `or` is evaluated we can also do the same for `and`. We once again make use of our `(p)` procedure in the below program.

 ``(and #t #f (p))``

If the program does not freeze due to an infinite resursive call and returns a value of false then we can be sure that `(p)` was not called. We can also be sure that `and` stopped evaluating further arguments as soon as it encountered an argument with a value that is false.

Why it would be useful to evaluate `or` in a way where it stops as soon as it encounters the first argument with a value or true and the same for `and` except that it stops as soon as it encounters an argument with value of true? I believe the answer is efficiency. All that is required for the boolean function or to be true is exactly one argument that is true. So as soon as it has been determined that one of our subexpressions does have a value that is true, we have enough information to know that the whole expression is true. Any further evaluation would add nothing useful and would hence be a waste of the processor's time. 
For the boolean function and, the converse is true. All that is required to determine if the whole statement is false is to find exactly one argument to the function that is false. Thus, there is no point in evaluating any further subexpressions after the first false one is found.
