( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place854 - place
    hoist854 - hoist
    place602 - place
    hoist602 - hoist
    place8 - place
    hoist8 - hoist
    place249 - place
    hoist249 - hoist
    place0 - place
    hoist0 - hoist
    crate398 - surface
    pallet398 - surface
    crate306 - surface
    pallet306 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist854 place854 )
    ( available hoist854 )
    ( hoist-at hoist602 place602 )
    ( available hoist602 )
    ( hoist-at hoist8 place8 )
    ( available hoist8 )
    ( hoist-at hoist249 place249 )
    ( available hoist249 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet398 place249 )
    ( surface-at crate398 place249 )
    ( on crate398 pallet398 )
    ( is-crate crate398 )
    ( clear crate398 )
    ( surface-at pallet306 place602 )
    ( surface-at crate306 place602 )
    ( on crate306 pallet306 )
    ( is-crate crate306 )
    ( clear crate306 )
  )
  ( :tasks
    ( Make-2Crate crate398 crate306 l000 )
  )
)
