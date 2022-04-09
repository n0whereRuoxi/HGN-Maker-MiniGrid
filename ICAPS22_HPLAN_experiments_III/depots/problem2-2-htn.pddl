( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place693 - place
    hoist693 - hoist
    place0 - place
    hoist0 - hoist
    crate535 - surface
    pallet535 - surface
    crate828 - surface
    pallet828 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist693 place693 )
    ( available hoist693 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet535 place693 )
    ( surface-at crate535 place693 )
    ( on crate535 pallet535 )
    ( is-crate crate535 )
    ( clear crate535 )
    ( surface-at pallet828 place693 )
    ( surface-at crate828 place693 )
    ( on crate828 pallet828 )
    ( is-crate crate828 )
    ( clear crate828 )
  )
  ( :tasks
    ( Make-2Crate crate535 crate828 l000 )
  )
)
