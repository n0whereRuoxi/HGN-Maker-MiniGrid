( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place93 - place
    hoist93 - hoist
    place802 - place
    hoist802 - hoist
    place299 - place
    hoist299 - hoist
    place503 - place
    hoist503 - hoist
    place0 - place
    hoist0 - hoist
    crate687 - surface
    pallet687 - surface
    crate643 - surface
    pallet643 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist93 place93 )
    ( available hoist93 )
    ( hoist-at hoist802 place802 )
    ( available hoist802 )
    ( hoist-at hoist299 place299 )
    ( available hoist299 )
    ( hoist-at hoist503 place503 )
    ( available hoist503 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet687 place503 )
    ( surface-at crate687 place503 )
    ( on crate687 pallet687 )
    ( is-crate crate687 )
    ( clear crate687 )
    ( surface-at pallet643 place93 )
    ( surface-at crate643 place93 )
    ( on crate643 pallet643 )
    ( is-crate crate643 )
    ( clear crate643 )
  )
  ( :goal
    ( and
    )
  )
)
