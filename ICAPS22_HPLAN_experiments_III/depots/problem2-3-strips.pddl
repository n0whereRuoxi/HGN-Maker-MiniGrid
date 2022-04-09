( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place508 - place
    hoist508 - hoist
    place959 - place
    hoist959 - hoist
    place0 - place
    hoist0 - hoist
    crate840 - surface
    pallet840 - surface
    crate953 - surface
    pallet953 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist508 place508 )
    ( available hoist508 )
    ( hoist-at hoist959 place959 )
    ( available hoist959 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet840 place959 )
    ( surface-at crate840 place959 )
    ( on crate840 pallet840 )
    ( is-crate crate840 )
    ( clear crate840 )
    ( surface-at pallet953 place508 )
    ( surface-at crate953 place508 )
    ( on crate953 pallet953 )
    ( is-crate crate953 )
    ( clear crate953 )
  )
  ( :goal
    ( and
    )
  )
)
