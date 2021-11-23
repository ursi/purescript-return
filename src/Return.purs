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
        Cont _ -> false
        Return _ -> true
    )
    ( case ra of
        Cont a -> a
        Return a -> a
    )

foreign import mkReturnableImpl :: ∀ a. (Return a -> a) -> ((Return a -> a) -> a) -> a

mkReturnable :: ∀ a. ((Return a -> a) -> a) -> a
mkReturnable = mkReturnableImpl unsafeThrow
