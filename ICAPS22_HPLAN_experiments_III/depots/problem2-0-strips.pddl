( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    place80 - place
    hoist80 - hoist
    place0 - place
    hoist0 - hoist
    crate502 - surface
    pallet502 - surface
    crate323 - surface
    pallet323 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist80 place80 )
    ( available hoist80 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet502 place80 )
    ( surface-at crate502 place80 )
    ( on crate502 pallet502 )
    ( is-crate crate502 )
    ( clear crate502 )
    ( surface-at pallet323 place80 )
    ( surface-at crate323 place80 )
    ( on crate323 pallet323 )
    ( is-crate crate323 )
    ( clear crate323 )
  )
  ( :goal
    ( and
    )
  )
)
