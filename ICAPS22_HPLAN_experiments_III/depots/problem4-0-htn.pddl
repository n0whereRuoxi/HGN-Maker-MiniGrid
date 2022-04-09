( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place699 - place
    hoist699 - hoist
    place755 - place
    hoist755 - hoist
    place523 - place
    hoist523 - hoist
    place3 - place
    hoist3 - hoist
    place530 - place
    hoist530 - hoist
    place492 - place
    hoist492 - hoist
    place0 - place
    hoist0 - hoist
    crate444 - surface
    pallet444 - surface
    crate42 - surface
    pallet42 - surface
    crate513 - surface
    pallet513 - surface
    crate906 - surface
    pallet906 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist699 place699 )
    ( available hoist699 )
    ( hoist-at hoist755 place755 )
    ( available hoist755 )
    ( hoist-at hoist523 place523 )
    ( available hoist523 )
    ( hoist-at hoist3 place3 )
    ( available hoist3 )
    ( hoist-at hoist530 place530 )
    ( available hoist530 )
    ( hoist-at hoist492 place492 )
    ( available hoist492 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet444 place699 )
    ( surface-at crate444 place699 )
    ( on crate444 pallet444 )
    ( is-crate crate444 )
    ( clear crate444 )
    ( surface-at pallet42 place492 )
    ( surface-at crate42 place492 )
    ( on crate42 pallet42 )
    ( is-crate crate42 )
    ( clear crate42 )
    ( surface-at pallet513 place755 )
    ( surface-at crate513 place755 )
    ( on crate513 pallet513 )
    ( is-crate crate513 )
    ( clear crate513 )
    ( surface-at pallet906 place492 )
    ( surface-at crate906 place492 )
    ( on crate906 pallet906 )
    ( is-crate crate906 )
    ( clear crate906 )
  )
  ( :tasks
    ( Make-4Crate crate444 crate42 crate513 crate906 l000 )
  )
)
