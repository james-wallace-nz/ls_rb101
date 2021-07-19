 1) B                         T
 2) C                         T
 3) A, B, D                   T
 4) D                         T
 5) B                         T
 6) A, B, C, D                T
 7) C, D                      T
 8) C                         T
 9) B, C, D                   T
10) B                         T
11) C                         T
12) A, C, D                   F

Blocks are delimited by either curly braces {} or do/end; however, code enclosed in this way does not always constitute a block. It is considered a block (and thereby creates a new scope for variables) if the {} or do/end immediately follows a method invocation.

13) C                         T
14) B, C, D                   T
15) A, B, D                   T
16) B                         T
17) B, C                      F

Ruby never tries to reference the local variable name because it's not within the method's scope.

18) D                         T
19) A                         T

17/19




