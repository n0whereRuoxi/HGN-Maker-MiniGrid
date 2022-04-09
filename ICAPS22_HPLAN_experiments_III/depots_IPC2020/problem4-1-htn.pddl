( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place1 - place
    hoist1 - hoist
    place857 - place
    hoist857 - hoist
    place0 - place
    hoist0 - hoist
    crate27 - surface
    pallet27 - surface
    crate312 - surface
    pallet312 - surface
    crate898 - surface
    pallet898 - surface
    crate726 - surface
    pallet726 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist1 place1 )
    ( available hoist1 )
    ( hoist-at hoist857 place857 )
    ( available hoist857 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet27 place1 )
    ( surface-at crate27 place1 )
    ( on crate27 pallet27 )
    ( is-crate crate27 )
    ( clear crate27 )
    ( surface-at pallet312 place857 )
    ( surface-at crate312 place857 )
    ( on crate312 pallet312 )
    ( is-crate crate312 )
    ( clear crate312 )
    ( surface-at pallet898 place857 )
    ( surface-at crate898 place857 )
    ( on crate898 pallet898 )
    ( is-crate crate898 )
    ( clear crate898 )
    ( surface-at pallet726 place857 )
    ( surface-at crate726 place857 )
    ( on crate726 pallet726 )
    ( is-crate crate726 )
    ( clear crate726 )
  )
  ( :tasks
    ( Make-4Crate pallet0 crate27 crate312 crate898 crate726 )
  )
)
