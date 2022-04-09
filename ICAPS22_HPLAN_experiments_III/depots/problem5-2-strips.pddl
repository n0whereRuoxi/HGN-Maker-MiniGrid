( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place512 - place
    hoist512 - hoist
    place44 - place
    hoist44 - hoist
    place928 - place
    hoist928 - hoist
    place755 - place
    hoist755 - hoist
    place217 - place
    hoist217 - hoist
    place0 - place
    hoist0 - hoist
    crate224 - surface
    pallet224 - surface
    crate344 - surface
    pallet344 - surface
    crate56 - surface
    pallet56 - surface
    crate417 - surface
    pallet417 - surface
    crate710 - surface
    pallet710 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist512 place512 )
    ( available hoist512 )
    ( hoist-at hoist44 place44 )
    ( available hoist44 )
    ( hoist-at hoist928 place928 )
    ( available hoist928 )
    ( hoist-at hoist755 place755 )
    ( available hoist755 )
    ( hoist-at hoist217 place217 )
    ( available hoist217 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet224 place755 )
    ( surface-at crate224 place755 )
    ( on crate224 pallet224 )
    ( is-crate crate224 )
    ( clear crate224 )
    ( surface-at pallet344 place512 )
    ( surface-at crate344 place512 )
    ( on crate344 pallet344 )
    ( is-crate crate344 )
    ( clear crate344 )
    ( surface-at pallet56 place755 )
    ( surface-at crate56 place755 )
    ( on crate56 pallet56 )
    ( is-crate crate56 )
    ( clear crate56 )
    ( surface-at pallet417 place512 )
    ( surface-at crate417 place512 )
    ( on crate417 pallet417 )
    ( is-crate crate417 )
    ( clear crate417 )
    ( surface-at pallet710 place928 )
    ( surface-at crate710 place928 )
    ( on crate710 pallet710 )
    ( is-crate crate710 )
    ( clear crate710 )
  )
  ( :goal
    ( and
    )
  )
)
