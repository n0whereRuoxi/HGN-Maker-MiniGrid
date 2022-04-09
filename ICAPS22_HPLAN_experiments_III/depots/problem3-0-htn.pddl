( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place781 - place
    hoist781 - hoist
    place564 - place
    hoist564 - hoist
    place0 - place
    hoist0 - hoist
    crate435 - surface
    pallet435 - surface
    crate390 - surface
    pallet390 - surface
    crate611 - surface
    pallet611 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist781 place781 )
    ( available hoist781 )
    ( hoist-at hoist564 place564 )
    ( available hoist564 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet435 place781 )
    ( surface-at crate435 place781 )
    ( on crate435 pallet435 )
    ( is-crate crate435 )
    ( clear crate435 )
    ( surface-at pallet390 place564 )
    ( surface-at crate390 place564 )
    ( on crate390 pallet390 )
    ( is-crate crate390 )
    ( clear crate390 )
    ( surface-at pallet611 place564 )
    ( surface-at crate611 place564 )
    ( on crate611 pallet611 )
    ( is-crate crate611 )
    ( clear crate611 )
  )
  ( :tasks
    ( Make-3Crate crate435 crate390 crate611 l000 )
  )
)
