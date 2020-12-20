module Return
  ( Return(..)
  , mkReturnable
  ) where

data Return a
  = Cont a
  | Return a

foreign import unsafeThrowImpl :: ∀ a. Boolean -> a -> a

unsafeThrow :: ∀ a. Return a -> a
unsafeThrow ra =
  unsafeThrowImpl
    ( case ra of
        Cont a -> false
        Return a -> true
    )
    ( case ra of
        Cont a -> a
        Return a -> a
    )

foreign import mkReturnableImpl :: ∀ a b. (Return a -> a) -> ((Return a -> a) -> b) -> b

mkReturnable :: ∀ a b. ((Return a -> a) -> b) -> b
mkReturnable = mkReturnableImpl unsafeThrow
