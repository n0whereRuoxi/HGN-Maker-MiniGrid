( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place820 - place
    hoist820 - hoist
    place156 - place
    hoist156 - hoist
    place0 - place
    hoist0 - hoist
    crate930 - surface
    pallet930 - surface
    crate758 - surface
    pallet758 - surface
    crate155 - surface
    pallet155 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist820 place820 )
    ( available hoist820 )
    ( hoist-at hoist156 place156 )
    ( available hoist156 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet930 place156 )
    ( surface-at crate930 place156 )
    ( on crate930 pallet930 )
    ( is-crate crate930 )
    ( clear crate930 )
    ( surface-at pallet758 place156 )
    ( surface-at crate758 place156 )
    ( on crate758 pallet758 )
    ( is-crate crate758 )
    ( clear crate758 )
    ( surface-at pallet155 place156 )
    ( surface-at crate155 place156 )
    ( on crate155 pallet155 )
    ( is-crate crate155 )
    ( clear crate155 )
  )
  ( :tasks
    ( Make-3Crate pallet0 crate930 crate758 crate155 )
  )
)
