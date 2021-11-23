module Return
  ( Return(..)
  , mkReturnable
  ) where

import Prelude

data Return a
  = Cont a
  | Return a

instance Functor Return where
  map f =
    case _ of
      Cont a -> Cont $ f a
      Return a -> Return $ f a

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
