( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place59 - place
    hoist59 - hoist
    place168 - place
    hoist168 - hoist
    place516 - place
    hoist516 - hoist
    place354 - place
    hoist354 - hoist
    place303 - place
    hoist303 - hoist
    place0 - place
    hoist0 - hoist
    crate978 - surface
    pallet978 - surface
    crate204 - surface
    pallet204 - surface
    crate332 - surface
    pallet332 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist59 place59 )
    ( available hoist59 )
    ( hoist-at hoist168 place168 )
    ( available hoist168 )
    ( hoist-at hoist516 place516 )
    ( available hoist516 )
    ( hoist-at hoist354 place354 )
    ( available hoist354 )
    ( hoist-at hoist303 place303 )
    ( available hoist303 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet978 place303 )
    ( surface-at crate978 place303 )
    ( on crate978 pallet978 )
    ( is-crate crate978 )
    ( clear crate978 )
    ( surface-at pallet204 place168 )
    ( surface-at crate204 place168 )
    ( on crate204 pallet204 )
    ( is-crate crate204 )
    ( clear crate204 )
    ( surface-at pallet332 place168 )
    ( surface-at crate332 place168 )
    ( on crate332 pallet332 )
    ( is-crate crate332 )
    ( clear crate332 )
  )
  ( :goal
    ( and
    )
  )
)
