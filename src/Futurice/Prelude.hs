{-# LANGUAGE CPP                #-}
{-# LANGUAGE ExplicitNamespaces #-}
{-# LANGUAGE PolyKinds          #-}
{-# LANGUAGE TypeOperators      #-}
module Futurice.Prelude (
    module Prelude.Compat,
    -- * Types
    HashMap,
    HashSet,
    IntMap,
    IntSet,
    Map,
    Natural,
    Set,
    Text,
    Proxy(..),
    Tagged, untag,
    Vector,
    module Data.Int,
    module Data.Word,
    -- * Data Classes
    Binary,
    Generic,
    Hashable(..),
    NFData(..),
    Semigroup(..),
    Typeable,
    IsString(..),
    -- * Monad classes
    MonadIO(..),
    MonadError(..),
    MonadThrow(..),
    MonadCatch(..),
    -- * Extras
    type (:$),
    ) where

import Prelude        ()
import Prelude.Compat

import Control.DeepSeq        (NFData (..))
import Control.Monad.Catch    (MonadCatch (..), MonadThrow (..))
import Control.Monad.IO.Class (MonadIO (..))
import Data.Binary            (Binary)
import Data.Hashable          (Hashable (..))
import Data.HashMap.Strict    (HashMap)
import Data.HashSet           (HashSet)
import Data.Int
import Data.IntMap.Strict     (IntMap)
import Data.IntSet            (IntSet)
import Data.Map.Strict        (Map)
import Data.Proxy             (Proxy (..))
import Data.Semigroup         (Semigroup (..))
import Data.Set               (Set)
import Data.String            (IsString (..))
import Data.Tagged            (Tagged, untag)
import Data.Text              (Text)
import Data.Typeable          (Typeable)
import Data.Vector            (Vector)
import Data.Word
import GHC.Generics           (Generic)
import Numeric.Natural        (Natural)

#if MIN_VERSION_mtl(2,2,0)
import Control.Monad.Except (MonadError (..))
#else
import Control.Monad.Error (MonadError (..))
#endif

-- Orphans
import Data.Binary.Orphans   ()
import Data.Hashable.Time    ()
import Data.Vector.Instances ()

-- Own extras

infixr 0 :$

-- | Type level '@'
type (:$) (f :: k -> l) (x :: k) = f x