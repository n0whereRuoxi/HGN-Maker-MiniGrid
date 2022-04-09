( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place565 - place
    hoist565 - hoist
    place768 - place
    hoist768 - hoist
    place513 - place
    hoist513 - hoist
    place0 - place
    hoist0 - hoist
    crate83 - surface
    pallet83 - surface
    crate473 - surface
    pallet473 - surface
    crate761 - surface
    pallet761 - surface
    crate520 - surface
    pallet520 - surface
    crate267 - surface
    pallet267 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist565 place565 )
    ( available hoist565 )
    ( hoist-at hoist768 place768 )
    ( available hoist768 )
    ( hoist-at hoist513 place513 )
    ( available hoist513 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet83 place768 )
    ( surface-at crate83 place768 )
    ( on crate83 pallet83 )
    ( is-crate crate83 )
    ( clear crate83 )
    ( surface-at pallet473 place565 )
    ( surface-at crate473 place565 )
    ( on crate473 pallet473 )
    ( is-crate crate473 )
    ( clear crate473 )
    ( surface-at pallet761 place565 )
    ( surface-at crate761 place565 )
    ( on crate761 pallet761 )
    ( is-crate crate761 )
    ( clear crate761 )
    ( surface-at pallet520 place513 )
    ( surface-at crate520 place513 )
    ( on crate520 pallet520 )
    ( is-crate crate520 )
    ( clear crate520 )
    ( surface-at pallet267 place768 )
    ( surface-at crate267 place768 )
    ( on crate267 pallet267 )
    ( is-crate crate267 )
    ( clear crate267 )
  )
  ( :tasks
    ( Make-5Crate crate83 crate473 crate761 crate520 crate267 l000 )
  )
)
