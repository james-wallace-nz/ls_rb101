 1) D                       T
 
 2) B, C, D                 T
 A adds the element to odd_numbers if number is odd, not the string repsenting an integer
 
 3) A, C, D                 T
 B, will only loop once, because `counter` is used for the outer and inner loop. After the first iteration, counter is now greater or equal to the size of the array
 
 4) A                       T
 
 5) B                       T
 
 6) B                       T
 
 7) C                       T
A, if `each` mutates the array then the block will execute less than seven times
B, `each` returns the calling collection, so it will return a hash when called on a hash.
D, `each` does not consider the truthiness of the block's return value
 
 8) B, D                    T
A, `select` returns an empty array if no block return values are truthy
C, `select` returns a new array that contains all of the same elements as the original array
D, `select` returns a hash when called on a hash

 9) B, C (`collect` is an alias of `map`)   T
A, `map` would return a new array containing `nil` for each element
D, `map` returns an array when called on a hash

10) B, C                    T

11) B, C                    T
A, D are transformation

12) B                       T

13) D                       T

14) C                       T

15) A                       T

16) A, C                    T
B, `map` will return a new array
D, `map` will return a new array with all elements transformed by the return value of the block

17) D                       T
A, `reject` will return a new array containing all elements for which the block returned a falsey value. In this case `nil` is returned by each block, so the new array will contain every element from the calling array.
B, `reject` considers the truthiness of the block return value.
C, `reject` returns a new array not a reference to the original array.


18) A, B, C                 T
D will create an `odd_numbers` array that contains even numbers and an `even_numbers` array that contains odd numbers.

19) B, C, D                 F - D returns a nested array
A, the hash value is given the block parameter name `country` when in fact this is the capital. Therefore, the `select` method will return key-value pairs where the capital starts with 'B'


20) C, D                    F
A, `map` and `select!` used.
B, `<= 60` days instead of `< 60`
C, block will return falsey only where both login `> 59` and not subscribed. Should use `||`` instead of `&&``

18/20

