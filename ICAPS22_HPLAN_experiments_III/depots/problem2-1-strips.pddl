( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place560 - place
    hoist560 - hoist
    place498 - place
    hoist498 - hoist
    place419 - place
    hoist419 - hoist
    place0 - place
    hoist0 - hoist
    crate284 - surface
    pallet284 - surface
    crate383 - surface
    pallet383 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist560 place560 )
    ( available hoist560 )
    ( hoist-at hoist498 place498 )
    ( available hoist498 )
    ( hoist-at hoist419 place419 )
    ( available hoist419 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet284 place560 )
    ( surface-at crate284 place560 )
    ( on crate284 pallet284 )
    ( is-crate crate284 )
    ( clear crate284 )
    ( surface-at pallet383 place498 )
    ( surface-at crate383 place498 )
    ( on crate383 pallet383 )
    ( is-crate crate383 )
    ( clear crate383 )
  )
  ( :goal
    ( and
    )
  )
)
