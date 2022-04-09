( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place682 - place
    hoist682 - hoist
    place219 - place
    hoist219 - hoist
    place852 - place
    hoist852 - hoist
    place494 - place
    hoist494 - hoist
    place855 - place
    hoist855 - hoist
    place131 - place
    hoist131 - hoist
    place394 - place
    hoist394 - hoist
    place258 - place
    hoist258 - hoist
    place850 - place
    hoist850 - hoist
    place350 - place
    hoist350 - hoist
    place0 - place
    hoist0 - hoist
    crate769 - surface
    pallet769 - surface
    crate976 - surface
    pallet976 - surface
    crate436 - surface
    pallet436 - surface
    crate560 - surface
    pallet560 - surface
    crate383 - surface
    pallet383 - surface
    crate218 - surface
    pallet218 - surface
    crate558 - surface
    pallet558 - surface
    crate402 - surface
    pallet402 - surface
    crate539 - surface
    pallet539 - surface
    crate979 - surface
    pallet979 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist682 place682 )
    ( available hoist682 )
    ( hoist-at hoist219 place219 )
    ( available hoist219 )
    ( hoist-at hoist852 place852 )
    ( available hoist852 )
    ( hoist-at hoist494 place494 )
    ( available hoist494 )
    ( hoist-at hoist855 place855 )
    ( available hoist855 )
    ( hoist-at hoist131 place131 )
    ( available hoist131 )
    ( hoist-at hoist394 place394 )
    ( available hoist394 )
    ( hoist-at hoist258 place258 )
    ( available hoist258 )
    ( hoist-at hoist850 place850 )
    ( available hoist850 )
    ( hoist-at hoist350 place350 )
    ( available hoist350 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet769 place850 )
    ( surface-at crate769 place850 )
    ( on crate769 pallet769 )
    ( is-crate crate769 )
    ( clear crate769 )
    ( surface-at pallet976 place219 )
    ( surface-at crate976 place219 )
    ( on crate976 pallet976 )
    ( is-crate crate976 )
    ( clear crate976 )
    ( surface-at pallet436 place258 )
    ( surface-at crate436 place258 )
    ( on crate436 pallet436 )
    ( is-crate crate436 )
    ( clear crate436 )
    ( surface-at pallet560 place258 )
    ( surface-at crate560 place258 )
    ( on crate560 pallet560 )
    ( is-crate crate560 )
    ( clear crate560 )
    ( surface-at pallet383 place850 )
    ( surface-at crate383 place850 )
    ( on crate383 pallet383 )
    ( is-crate crate383 )
    ( clear crate383 )
    ( surface-at pallet218 place131 )
    ( surface-at crate218 place131 )
    ( on crate218 pallet218 )
    ( is-crate crate218 )
    ( clear crate218 )
    ( surface-at pallet558 place852 )
    ( surface-at crate558 place852 )
    ( on crate558 pallet558 )
    ( is-crate crate558 )
    ( clear crate558 )
    ( surface-at pallet402 place855 )
    ( surface-at crate402 place855 )
    ( on crate402 pallet402 )
    ( is-crate crate402 )
    ( clear crate402 )
    ( surface-at pallet539 place852 )
    ( surface-at crate539 place852 )
    ( on crate539 pallet539 )
    ( is-crate crate539 )
    ( clear crate539 )
    ( surface-at pallet979 place394 )
    ( surface-at crate979 place394 )
    ( on crate979 pallet979 )
    ( is-crate crate979 )
    ( clear crate979 )
  )
  ( :tasks
    ( Make-10Crate crate769 crate976 crate436 crate560 crate383 crate218 crate558 crate402 crate539 crate979 l000 )
  )
)
