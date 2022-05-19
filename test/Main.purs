module Test.Main where

import MasonPrelude
import Effect.Exception.Unsafe as Ex
import Data.Array ((..))
import Return (Return(..))
import Return.Folds as R
import Test.Assert (assert')

main :: Effect Unit
main = do
  assert' "gets the value from Cont"
    $ R.foldl (\acc n -> Cont $ n + acc) 0 (1 .. 10)
    == 55
  assert' "gets the value from Return"
    $ R.foldl (\acc n -> Return $ n + acc) 0 (1 .. 10)
    == 1
  assert' "throws the appropriate value on actual errors"
    $ catch_ (\_ -> foldl (\_ _ -> Ex.unsafeThrow "test") 0 $ 1 .. 10)
    == "Error: test"

foreign import catch_ :: ∀ a. (Unit -> a) -> String
