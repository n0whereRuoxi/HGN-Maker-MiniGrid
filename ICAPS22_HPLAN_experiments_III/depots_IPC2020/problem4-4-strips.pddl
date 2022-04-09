( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place140 - place
    hoist140 - hoist
    place475 - place
    hoist475 - hoist
    place869 - place
    hoist869 - hoist
    place34 - place
    hoist34 - hoist
    place324 - place
    hoist324 - hoist
    place288 - place
    hoist288 - hoist
    place0 - place
    hoist0 - hoist
    crate558 - surface
    pallet558 - surface
    crate880 - surface
    pallet880 - surface
    crate977 - surface
    pallet977 - surface
    crate540 - surface
    pallet540 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist140 place140 )
    ( available hoist140 )
    ( hoist-at hoist475 place475 )
    ( available hoist475 )
    ( hoist-at hoist869 place869 )
    ( available hoist869 )
    ( hoist-at hoist34 place34 )
    ( available hoist34 )
    ( hoist-at hoist324 place324 )
    ( available hoist324 )
    ( hoist-at hoist288 place288 )
    ( available hoist288 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet558 place324 )
    ( surface-at crate558 place324 )
    ( on crate558 pallet558 )
    ( is-crate crate558 )
    ( clear crate558 )
    ( surface-at pallet880 place140 )
    ( surface-at crate880 place140 )
    ( on crate880 pallet880 )
    ( is-crate crate880 )
    ( clear crate880 )
    ( surface-at pallet977 place288 )
    ( surface-at crate977 place288 )
    ( on crate977 pallet977 )
    ( is-crate crate977 )
    ( clear crate977 )
    ( surface-at pallet540 place475 )
    ( surface-at crate540 place475 )
    ( on crate540 pallet540 )
    ( is-crate crate540 )
    ( clear crate540 )
  )
  ( :goal
    ( and
    )
  )
)
