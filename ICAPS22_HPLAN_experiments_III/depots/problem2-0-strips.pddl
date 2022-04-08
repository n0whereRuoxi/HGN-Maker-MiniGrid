( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    place567 - place
    pallet567 - surface
    hoist567 - hoist
    place238 - place
    pallet238 - surface
    hoist238 - hoist
    place0 - place
    pallet0 - surface
    hoist0 - hoist
    crate372 - surface
    crate942 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist567 place567 )
    ( available hoist567 )
    ( surface-at pallet567 place567 )
    ( hoist-at hoist238 place238 )
    ( available hoist238 )
    ( surface-at pallet238 place238 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet0 place0 )
    ( surface-at crate372 place567 )
    ( on crate372 pallet567 )
    ( is-crate crate372 )
    ( clear crate372 )
    ( surface-at crate942 place238 )
    ( on crate942 pallet238 )
    ( is-crate crate942 )
    ( clear crate942 )
  )
  ( :goal
    ( and
    )
  )
)
