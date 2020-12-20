# Return

Return introduces a new data type
```purescript
data Return a
  = Cont a
  | Return a
```

and a function 

```purescript
mkReturnable :: ∀ a b. ((Return a -> a) -> b) -> b
```

Using `mkReturnable` you can create functions that "return" values early in a way that you normally would have to use explicit recursion to accomplish.

For example:

```purescript
foldl' :: ∀ a b f. Foldable f => (b -> a -> Return b) -> b -> f a -> b
foldl' f init as = mkReturnable \return -> foldl (\b a -> return $ f b a) init as
```

This is nice because it allows for you to define, for fee, folds that can exit early for anything that already has a `Foldable` instance, instead of having to use recursion to handle each case differently.
