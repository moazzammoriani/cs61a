The procedure new-if works completely fine so long as there is no use of recursion. The problem with using the procedure new-if instead of the built-in special form ifis that as soon as we compose a procedure using new-if and make use of recursion inside the new-if procedure we allow leave ourselves vulnerable to having our procedure recurse infinitely. Since, the scheme interpreter uses applicative order--which evaluates all the subexpressions of a procedure--all the arguments of new-if are evaluated. This is a problem because even when the guess is good enough and we don't want to call sqrt-iter, it will still be called by the interpreter when it tries to evaluate all the arguments of new-if and this will happen infinitely or until the operating system realizes that this particular process is overusing memory and decides to stop it.  