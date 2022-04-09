( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place492 - place
    hoist492 - hoist
    place514 - place
    hoist514 - hoist
    place381 - place
    hoist381 - hoist
    place0 - place
    hoist0 - hoist
    crate644 - surface
    pallet644 - surface
    crate34 - surface
    pallet34 - surface
    crate805 - surface
    pallet805 - surface
    crate630 - surface
    pallet630 - surface
    crate442 - surface
    pallet442 - surface
    crate469 - surface
    pallet469 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist492 place492 )
    ( available hoist492 )
    ( hoist-at hoist514 place514 )
    ( available hoist514 )
    ( hoist-at hoist381 place381 )
    ( available hoist381 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet644 place492 )
    ( surface-at crate644 place492 )
    ( on crate644 pallet644 )
    ( is-crate crate644 )
    ( clear crate644 )
    ( surface-at pallet34 place514 )
    ( surface-at crate34 place514 )
    ( on crate34 pallet34 )
    ( is-crate crate34 )
    ( clear crate34 )
    ( surface-at pallet805 place514 )
    ( surface-at crate805 place514 )
    ( on crate805 pallet805 )
    ( is-crate crate805 )
    ( clear crate805 )
    ( surface-at pallet630 place381 )
    ( surface-at crate630 place381 )
    ( on crate630 pallet630 )
    ( is-crate crate630 )
    ( clear crate630 )
    ( surface-at pallet442 place514 )
    ( surface-at crate442 place514 )
    ( on crate442 pallet442 )
    ( is-crate crate442 )
    ( clear crate442 )
    ( surface-at pallet469 place381 )
    ( surface-at crate469 place381 )
    ( on crate469 pallet469 )
    ( is-crate crate469 )
    ( clear crate469 )
  )
  ( :tasks
    ( Make-6Crate pallet0 crate644 crate34 crate805 crate630 crate442 crate469 )
  )
)
