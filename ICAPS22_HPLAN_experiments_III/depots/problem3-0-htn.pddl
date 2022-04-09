( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place454 - place
    hoist454 - hoist
    place849 - place
    hoist849 - hoist
    place634 - place
    hoist634 - hoist
    place0 - place
    hoist0 - hoist
    crate733 - surface
    pallet733 - surface
    crate616 - surface
    pallet616 - surface
    crate86 - surface
    pallet86 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist454 place454 )
    ( available hoist454 )
    ( hoist-at hoist849 place849 )
    ( available hoist849 )
    ( hoist-at hoist634 place634 )
    ( available hoist634 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet733 place634 )
    ( surface-at crate733 place634 )
    ( on crate733 pallet733 )
    ( is-crate crate733 )
    ( clear crate733 )
    ( surface-at pallet616 place634 )
    ( surface-at crate616 place634 )
    ( on crate616 pallet616 )
    ( is-crate crate616 )
    ( clear crate616 )
    ( surface-at pallet86 place454 )
    ( surface-at crate86 place454 )
    ( on crate86 pallet86 )
    ( is-crate crate86 )
    ( clear crate86 )
  )
  ( :tasks
    ( Make-3Crate crate733 crate616 crate86 l000 )
  )
)
