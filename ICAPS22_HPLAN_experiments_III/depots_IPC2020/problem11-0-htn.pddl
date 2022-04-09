( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place208 - place
    hoist208 - hoist
    place264 - place
    hoist264 - hoist
    place4 - place
    hoist4 - hoist
    place713 - place
    hoist713 - hoist
    place78 - place
    hoist78 - hoist
    place391 - place
    hoist391 - hoist
    place132 - place
    hoist132 - hoist
    place0 - place
    hoist0 - hoist
    crate122 - surface
    pallet122 - surface
    crate773 - surface
    pallet773 - surface
    crate505 - surface
    pallet505 - surface
    crate40 - surface
    pallet40 - surface
    crate565 - surface
    pallet565 - surface
    crate171 - surface
    pallet171 - surface
    crate761 - surface
    pallet761 - surface
    crate619 - surface
    pallet619 - surface
    crate934 - surface
    pallet934 - surface
    crate799 - surface
    pallet799 - surface
    crate847 - surface
    pallet847 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist208 place208 )
    ( available hoist208 )
    ( hoist-at hoist264 place264 )
    ( available hoist264 )
    ( hoist-at hoist4 place4 )
    ( available hoist4 )
    ( hoist-at hoist713 place713 )
    ( available hoist713 )
    ( hoist-at hoist78 place78 )
    ( available hoist78 )
    ( hoist-at hoist391 place391 )
    ( available hoist391 )
    ( hoist-at hoist132 place132 )
    ( available hoist132 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet122 place264 )
    ( surface-at crate122 place264 )
    ( on crate122 pallet122 )
    ( is-crate crate122 )
    ( clear crate122 )
    ( surface-at pallet773 place713 )
    ( surface-at crate773 place713 )
    ( on crate773 pallet773 )
    ( is-crate crate773 )
    ( clear crate773 )
    ( surface-at pallet505 place78 )
    ( surface-at crate505 place78 )
    ( on crate505 pallet505 )
    ( is-crate crate505 )
    ( clear crate505 )
    ( surface-at pallet40 place132 )
    ( surface-at crate40 place132 )
    ( on crate40 pallet40 )
    ( is-crate crate40 )
    ( clear crate40 )
    ( surface-at pallet565 place132 )
    ( surface-at crate565 place132 )
    ( on crate565 pallet565 )
    ( is-crate crate565 )
    ( clear crate565 )
    ( surface-at pallet171 place132 )
    ( surface-at crate171 place132 )
    ( on crate171 pallet171 )
    ( is-crate crate171 )
    ( clear crate171 )
    ( surface-at pallet761 place713 )
    ( surface-at crate761 place713 )
    ( on crate761 pallet761 )
    ( is-crate crate761 )
    ( clear crate761 )
    ( surface-at pallet619 place4 )
    ( surface-at crate619 place4 )
    ( on crate619 pallet619 )
    ( is-crate crate619 )
    ( clear crate619 )
    ( surface-at pallet934 place264 )
    ( surface-at crate934 place264 )
    ( on crate934 pallet934 )
    ( is-crate crate934 )
    ( clear crate934 )
    ( surface-at pallet799 place132 )
    ( surface-at crate799 place132 )
    ( on crate799 pallet799 )
    ( is-crate crate799 )
    ( clear crate799 )
    ( surface-at pallet847 place208 )
    ( surface-at crate847 place208 )
    ( on crate847 pallet847 )
    ( is-crate crate847 )
    ( clear crate847 )
  )
  ( :tasks
    ( Make-11Crate pallet0 crate122 crate773 crate505 crate40 crate565 crate171 crate761 crate619 crate934 crate799 crate847 )
  )
)
