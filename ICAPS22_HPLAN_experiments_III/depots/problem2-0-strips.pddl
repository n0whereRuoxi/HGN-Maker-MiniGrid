( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place951 - place
    hoist951 - hoist
    place0 - place
    hoist0 - hoist
    crate987 - surface
    pallet987 - surface
    crate684 - surface
    pallet684 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist951 place951 )
    ( available hoist951 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet987 place951 )
    ( surface-at crate987 place951 )
    ( on crate987 pallet987 )
    ( is-crate crate987 )
    ( clear crate987 )
    ( surface-at pallet684 place951 )
    ( surface-at crate684 place951 )
    ( on crate684 pallet684 )
    ( is-crate crate684 )
    ( clear crate684 )
  )
  ( :goal
    ( and
    )
  )
)
