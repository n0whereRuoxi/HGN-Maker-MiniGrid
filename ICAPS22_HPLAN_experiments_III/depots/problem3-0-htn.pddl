( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    place767 - place
    pallet767 - surface
    hoist767 - hoist
    place767 - place
    pallet767 - surface
    hoist767 - hoist
    place590 - place
    pallet590 - surface
    hoist590 - hoist
    place0 - place
    pallet0 - surface
    hoist0 - hoist
    crate581 - surface
    crate161 - surface
    crate636 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist767 place767 )
    ( available hoist767 )
    ( surface-at pallet767 place767 )
    ( hoist-at hoist767 place767 )
    ( available hoist767 )
    ( surface-at pallet767 place767 )
    ( hoist-at hoist590 place590 )
    ( available hoist590 )
    ( surface-at pallet590 place590 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet0 place0 )
    ( surface-at crate581 place767 )
    ( on crate581 pallet767 )
    ( is-crate crate581 )
    ( clear crate581 )
    ( surface-at crate161 place767 )
    ( on crate161 pallet767 )
    ( is-crate crate161 )
    ( clear crate161 )
    ( surface-at crate636 place590 )
    ( on crate636 pallet590 )
    ( is-crate crate636 )
    ( clear crate636 )
  )
  ( :tasks
    ( Make-3Crate crate581 crate161 crate636 l000 )
  )
)
