( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place978 - place
    hoist978 - hoist
    place0 - place
    hoist0 - hoist
    crate731 - surface
    pallet731 - surface
    crate23 - surface
    pallet23 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist978 place978 )
    ( available hoist978 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet731 place978 )
    ( surface-at crate731 place978 )
    ( on crate731 pallet731 )
    ( is-crate crate731 )
    ( clear crate731 )
    ( surface-at pallet23 place978 )
    ( surface-at crate23 place978 )
    ( on crate23 pallet23 )
    ( is-crate crate23 )
    ( clear crate23 )
  )
  ( :tasks
    ( Make-2Crate pallet0 crate731 crate23 )
  )
)
