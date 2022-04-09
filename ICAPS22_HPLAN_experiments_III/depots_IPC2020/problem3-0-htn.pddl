( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place727 - place
    hoist727 - hoist
    place1 - place
    hoist1 - hoist
    place379 - place
    hoist379 - hoist
    place829 - place
    hoist829 - hoist
    place0 - place
    hoist0 - hoist
    crate605 - surface
    pallet605 - surface
    crate171 - surface
    pallet171 - surface
    crate965 - surface
    pallet965 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist727 place727 )
    ( available hoist727 )
    ( hoist-at hoist1 place1 )
    ( available hoist1 )
    ( hoist-at hoist379 place379 )
    ( available hoist379 )
    ( hoist-at hoist829 place829 )
    ( available hoist829 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet605 place727 )
    ( surface-at crate605 place727 )
    ( on crate605 pallet605 )
    ( is-crate crate605 )
    ( clear crate605 )
    ( surface-at pallet171 place379 )
    ( surface-at crate171 place379 )
    ( on crate171 pallet171 )
    ( is-crate crate171 )
    ( clear crate171 )
    ( surface-at pallet965 place1 )
    ( surface-at crate965 place1 )
    ( on crate965 pallet965 )
    ( is-crate crate965 )
    ( clear crate965 )
  )
  ( :tasks
    ( Make-3Crate pallet0 crate605 crate171 crate965 )
  )
)
