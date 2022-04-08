( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    place276 - place
    hoist276 - hoist
    place372 - place
    hoist372 - hoist
    place950 - place
    hoist950 - hoist
    place0 - place
    hoist0 - hoist
    crate870 - surface
    pallet870 - surface
    crate39 - surface
    pallet39 - surface
    crate524 - surface
    pallet524 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist276 place276 )
    ( available hoist276 )
    ( hoist-at hoist372 place372 )
    ( available hoist372 )
    ( hoist-at hoist950 place950 )
    ( available hoist950 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet870 place372 )
    ( surface-at crate870 place372 )
    ( on crate870 pallet870 )
    ( is-crate crate870 )
    ( clear crate870 )
    ( surface-at pallet39 place276 )
    ( surface-at crate39 place276 )
    ( on crate39 pallet39 )
    ( is-crate crate39 )
    ( clear crate39 )
    ( surface-at pallet524 place372 )
    ( surface-at crate524 place372 )
    ( on crate524 pallet524 )
    ( is-crate crate524 )
    ( clear crate524 )
  )
  ( :goal
    ( and
    )
  )
)
