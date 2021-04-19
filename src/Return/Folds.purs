module Return.Folds where

import Prelude

import Data.Foldable (class Foldable)
import Data.Foldable as F
import Data.FoldableWithIndex (class FoldableWithIndex)
import Data.FoldableWithIndex as Fi
import PointFree ((<.), (<..), (<...))
import Return (Return, mkReturnable)

foldl :: ∀ a b f. Foldable f => (b -> a -> Return b) -> b -> f a -> b
foldl f init as = mkReturnable \return -> F.foldl (return <.. f) init as

foldr :: ∀ a b f. Foldable f => (a -> b -> Return b) -> b -> f a -> b
foldr f init as = mkReturnable \return -> F.foldr (return <.. f) init as

foldMap :: ∀ a f m. Foldable f => Monoid m => (a -> Return m) -> f a -> m
foldMap f as = mkReturnable \return -> F.foldMap (return <. f) as

foldlWithIndex :: ∀ a b f i. FoldableWithIndex i f => (i -> b -> a -> Return b) -> b -> f a -> b
foldlWithIndex f init as = mkReturnable \return -> Fi.foldlWithIndex (return <... f) init as

foldrWithIndex :: ∀ a b f i. FoldableWithIndex i f => (i -> a -> b -> Return b) -> b -> f a -> b
foldrWithIndex f init as = mkReturnable \return -> Fi.foldrWithIndex (return <... f) init as

foldMapWithIndex :: ∀ a f i m. FoldableWithIndex i f => Monoid m => (i -> a -> Return m) -> f a -> m
foldMapWithIndex f as = mkReturnable \return -> Fi.foldMapWithIndex (return <.. f) as
