( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place832 - place
    hoist832 - hoist
    place926 - place
    hoist926 - hoist
    place562 - place
    hoist562 - hoist
    place2 - place
    hoist2 - hoist
    place566 - place
    hoist566 - hoist
    place850 - place
    hoist850 - hoist
    place169 - place
    hoist169 - hoist
    place0 - place
    hoist0 - hoist
    crate518 - surface
    pallet518 - surface
    crate2 - surface
    pallet2 - surface
    crate89 - surface
    pallet89 - surface
    crate61 - surface
    pallet61 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist832 place832 )
    ( available hoist832 )
    ( hoist-at hoist926 place926 )
    ( available hoist926 )
    ( hoist-at hoist562 place562 )
    ( available hoist562 )
    ( hoist-at hoist2 place2 )
    ( available hoist2 )
    ( hoist-at hoist566 place566 )
    ( available hoist566 )
    ( hoist-at hoist850 place850 )
    ( available hoist850 )
    ( hoist-at hoist169 place169 )
    ( available hoist169 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet518 place832 )
    ( surface-at crate518 place832 )
    ( on crate518 pallet518 )
    ( is-crate crate518 )
    ( clear crate518 )
    ( surface-at pallet2 place566 )
    ( surface-at crate2 place566 )
    ( on crate2 pallet2 )
    ( is-crate crate2 )
    ( clear crate2 )
    ( surface-at pallet89 place169 )
    ( surface-at crate89 place169 )
    ( on crate89 pallet89 )
    ( is-crate crate89 )
    ( clear crate89 )
    ( surface-at pallet61 place850 )
    ( surface-at crate61 place850 )
    ( on crate61 pallet61 )
    ( is-crate crate61 )
    ( clear crate61 )
  )
  ( :goal
    ( and
    )
  )
)
