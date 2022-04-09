( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place844 - place
    hoist844 - hoist
    place508 - place
    hoist508 - hoist
    place144 - place
    hoist144 - hoist
    place612 - place
    hoist612 - hoist
    place0 - place
    hoist0 - hoist
    crate863 - surface
    pallet863 - surface
    crate218 - surface
    pallet218 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist844 place844 )
    ( available hoist844 )
    ( hoist-at hoist508 place508 )
    ( available hoist508 )
    ( hoist-at hoist144 place144 )
    ( available hoist144 )
    ( hoist-at hoist612 place612 )
    ( available hoist612 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet863 place612 )
    ( surface-at crate863 place612 )
    ( on crate863 pallet863 )
    ( is-crate crate863 )
    ( clear crate863 )
    ( surface-at pallet218 place508 )
    ( surface-at crate218 place508 )
    ( on crate218 pallet218 )
    ( is-crate crate218 )
    ( clear crate218 )
  )
  ( :goal
    ( and
    )
  )
)
