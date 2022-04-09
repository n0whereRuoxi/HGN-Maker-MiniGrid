( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place302 - place
    hoist302 - hoist
    place500 - place
    hoist500 - hoist
    place606 - place
    hoist606 - hoist
    place635 - place
    hoist635 - hoist
    place876 - place
    hoist876 - hoist
    place414 - place
    hoist414 - hoist
    place0 - place
    hoist0 - hoist
    crate746 - surface
    pallet746 - surface
    crate345 - surface
    pallet345 - surface
    crate349 - surface
    pallet349 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist302 place302 )
    ( available hoist302 )
    ( hoist-at hoist500 place500 )
    ( available hoist500 )
    ( hoist-at hoist606 place606 )
    ( available hoist606 )
    ( hoist-at hoist635 place635 )
    ( available hoist635 )
    ( hoist-at hoist876 place876 )
    ( available hoist876 )
    ( hoist-at hoist414 place414 )
    ( available hoist414 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet746 place500 )
    ( surface-at crate746 place500 )
    ( on crate746 pallet746 )
    ( is-crate crate746 )
    ( clear crate746 )
    ( surface-at pallet345 place606 )
    ( surface-at crate345 place606 )
    ( on crate345 pallet345 )
    ( is-crate crate345 )
    ( clear crate345 )
    ( surface-at pallet349 place635 )
    ( surface-at crate349 place635 )
    ( on crate349 pallet349 )
    ( is-crate crate349 )
    ( clear crate349 )
  )
  ( :goal
    ( and
    )
  )
)
