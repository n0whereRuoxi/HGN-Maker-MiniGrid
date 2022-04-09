( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place496 - place
    hoist496 - hoist
    place23 - place
    hoist23 - hoist
    place561 - place
    hoist561 - hoist
    place407 - place
    hoist407 - hoist
    place891 - place
    hoist891 - hoist
    place0 - place
    hoist0 - hoist
    crate822 - surface
    pallet822 - surface
    crate282 - surface
    pallet282 - surface
    crate870 - surface
    pallet870 - surface
    crate124 - surface
    pallet124 - surface
    crate677 - surface
    pallet677 - surface
    crate216 - surface
    pallet216 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist496 place496 )
    ( available hoist496 )
    ( hoist-at hoist23 place23 )
    ( available hoist23 )
    ( hoist-at hoist561 place561 )
    ( available hoist561 )
    ( hoist-at hoist407 place407 )
    ( available hoist407 )
    ( hoist-at hoist891 place891 )
    ( available hoist891 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet822 place407 )
    ( surface-at crate822 place407 )
    ( on crate822 pallet822 )
    ( is-crate crate822 )
    ( clear crate822 )
    ( surface-at pallet282 place891 )
    ( surface-at crate282 place891 )
    ( on crate282 pallet282 )
    ( is-crate crate282 )
    ( clear crate282 )
    ( surface-at pallet870 place407 )
    ( surface-at crate870 place407 )
    ( on crate870 pallet870 )
    ( is-crate crate870 )
    ( clear crate870 )
    ( surface-at pallet124 place23 )
    ( surface-at crate124 place23 )
    ( on crate124 pallet124 )
    ( is-crate crate124 )
    ( clear crate124 )
    ( surface-at pallet677 place23 )
    ( surface-at crate677 place23 )
    ( on crate677 pallet677 )
    ( is-crate crate677 )
    ( clear crate677 )
    ( surface-at pallet216 place23 )
    ( surface-at crate216 place23 )
    ( on crate216 pallet216 )
    ( is-crate crate216 )
    ( clear crate216 )
  )
  ( :tasks
    ( Make-6Crate pallet0 crate822 crate282 crate870 crate124 crate677 crate216 )
  )
)
