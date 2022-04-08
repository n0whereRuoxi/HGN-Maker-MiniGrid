( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    place860 - place
    pallet860 - surface
    hoist860 - hoist
    place860 - place
    pallet860 - surface
    hoist860 - hoist
    place860 - place
    pallet860 - surface
    hoist860 - hoist
    place860 - place
    pallet860 - surface
    hoist860 - hoist
    place0 - place
    pallet0 - surface
    hoist0 - hoist
    crate514 - surface
    crate606 - surface
    crate600 - surface
    crate332 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist860 place860 )
    ( available hoist860 )
    ( surface-at pallet860 place860 )
    ( hoist-at hoist860 place860 )
    ( available hoist860 )
    ( surface-at pallet860 place860 )
    ( hoist-at hoist860 place860 )
    ( available hoist860 )
    ( surface-at pallet860 place860 )
    ( hoist-at hoist860 place860 )
    ( available hoist860 )
    ( surface-at pallet860 place860 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet0 place0 )
    ( surface-at crate514 place860 )
    ( on crate514 pallet860 )
    ( is-crate crate514 )
    ( clear crate514 )
    ( surface-at crate606 place860 )
    ( on crate606 pallet860 )
    ( is-crate crate606 )
    ( clear crate606 )
    ( surface-at crate600 place860 )
    ( on crate600 pallet860 )
    ( is-crate crate600 )
    ( clear crate600 )
    ( surface-at crate332 place860 )
    ( on crate332 pallet860 )
    ( is-crate crate332 )
    ( clear crate332 )
  )
  ( :tasks
    ( Make-4Crate crate514 crate606 crate600 crate332 l000 )
  )
)
