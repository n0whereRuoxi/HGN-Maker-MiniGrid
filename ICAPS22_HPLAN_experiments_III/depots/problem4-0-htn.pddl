( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    place272 - place
    hoist272 - hoist
    place707 - place
    hoist707 - hoist
    place184 - place
    hoist184 - hoist
    place940 - place
    hoist940 - hoist
    place42 - place
    hoist42 - hoist
    place237 - place
    hoist237 - hoist
    place0 - place
    hoist0 - hoist
    crate557 - surface
    pallet557 - surface
    crate808 - surface
    pallet808 - surface
    crate226 - surface
    pallet226 - surface
    crate501 - surface
    pallet501 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist272 place272 )
    ( available hoist272 )
    ( hoist-at hoist707 place707 )
    ( available hoist707 )
    ( hoist-at hoist184 place184 )
    ( available hoist184 )
    ( hoist-at hoist940 place940 )
    ( available hoist940 )
    ( hoist-at hoist42 place42 )
    ( available hoist42 )
    ( hoist-at hoist237 place237 )
    ( available hoist237 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet557 place272 )
    ( surface-at crate557 place272 )
    ( on crate557 pallet557 )
    ( is-crate crate557 )
    ( clear crate557 )
    ( surface-at pallet808 place940 )
    ( surface-at crate808 place940 )
    ( on crate808 pallet808 )
    ( is-crate crate808 )
    ( clear crate808 )
    ( surface-at pallet226 place707 )
    ( surface-at crate226 place707 )
    ( on crate226 pallet226 )
    ( is-crate crate226 )
    ( clear crate226 )
    ( surface-at pallet501 place237 )
    ( surface-at crate501 place237 )
    ( on crate501 pallet501 )
    ( is-crate crate501 )
    ( clear crate501 )
  )
  ( :tasks
    ( Make-4Crate crate557 crate808 crate226 crate501 l000 )
  )
)
