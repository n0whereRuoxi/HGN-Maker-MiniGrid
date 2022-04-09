( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place23 - place
    hoist23 - hoist
    place245 - place
    hoist245 - hoist
    place0 - place
    hoist0 - hoist
    crate204 - surface
    pallet204 - surface
    crate299 - surface
    pallet299 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist23 place23 )
    ( available hoist23 )
    ( hoist-at hoist245 place245 )
    ( available hoist245 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet204 place23 )
    ( surface-at crate204 place23 )
    ( on crate204 pallet204 )
    ( is-crate crate204 )
    ( clear crate204 )
    ( surface-at pallet299 place23 )
    ( surface-at crate299 place23 )
    ( on crate299 pallet299 )
    ( is-crate crate299 )
    ( clear crate299 )
  )
  ( :tasks
    ( Make-2Crate pallet0 crate204 crate299 )
  )
)
