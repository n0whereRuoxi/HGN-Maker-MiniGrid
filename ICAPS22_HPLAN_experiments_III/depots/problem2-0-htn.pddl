( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    place557 - place
    hoist557 - hoist
    place62 - place
    hoist62 - hoist
    place231 - place
    hoist231 - hoist
    place502 - place
    hoist502 - hoist
    place0 - place
    hoist0 - hoist
    crate581 - surface
    pallet581 - surface
    crate313 - surface
    pallet313 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist557 place557 )
    ( available hoist557 )
    ( hoist-at hoist62 place62 )
    ( available hoist62 )
    ( hoist-at hoist231 place231 )
    ( available hoist231 )
    ( hoist-at hoist502 place502 )
    ( available hoist502 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet581 place502 )
    ( surface-at crate581 place502 )
    ( on crate581 pallet581 )
    ( is-crate crate581 )
    ( clear crate581 )
    ( surface-at pallet313 place557 )
    ( surface-at crate313 place557 )
    ( on crate313 pallet313 )
    ( is-crate crate313 )
    ( clear crate313 )
  )
  ( :tasks
    ( Make-2Crate crate581 crate313 l000 )
  )
)
