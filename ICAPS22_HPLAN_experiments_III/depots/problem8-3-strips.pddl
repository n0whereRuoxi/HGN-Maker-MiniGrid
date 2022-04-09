( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place639 - place
    hoist639 - hoist
    place785 - place
    hoist785 - hoist
    place163 - place
    hoist163 - hoist
    place745 - place
    hoist745 - hoist
    place342 - place
    hoist342 - hoist
    place404 - place
    hoist404 - hoist
    place242 - place
    hoist242 - hoist
    place0 - place
    hoist0 - hoist
    crate352 - surface
    pallet352 - surface
    crate654 - surface
    pallet654 - surface
    crate696 - surface
    pallet696 - surface
    crate56 - surface
    pallet56 - surface
    crate221 - surface
    pallet221 - surface
    crate713 - surface
    pallet713 - surface
    crate174 - surface
    pallet174 - surface
    crate439 - surface
    pallet439 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist639 place639 )
    ( available hoist639 )
    ( hoist-at hoist785 place785 )
    ( available hoist785 )
    ( hoist-at hoist163 place163 )
    ( available hoist163 )
    ( hoist-at hoist745 place745 )
    ( available hoist745 )
    ( hoist-at hoist342 place342 )
    ( available hoist342 )
    ( hoist-at hoist404 place404 )
    ( available hoist404 )
    ( hoist-at hoist242 place242 )
    ( available hoist242 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet352 place404 )
    ( surface-at crate352 place404 )
    ( on crate352 pallet352 )
    ( is-crate crate352 )
    ( clear crate352 )
    ( surface-at pallet654 place745 )
    ( surface-at crate654 place745 )
    ( on crate654 pallet654 )
    ( is-crate crate654 )
    ( clear crate654 )
    ( surface-at pallet696 place342 )
    ( surface-at crate696 place342 )
    ( on crate696 pallet696 )
    ( is-crate crate696 )
    ( clear crate696 )
    ( surface-at pallet56 place342 )
    ( surface-at crate56 place342 )
    ( on crate56 pallet56 )
    ( is-crate crate56 )
    ( clear crate56 )
    ( surface-at pallet221 place745 )
    ( surface-at crate221 place745 )
    ( on crate221 pallet221 )
    ( is-crate crate221 )
    ( clear crate221 )
    ( surface-at pallet713 place404 )
    ( surface-at crate713 place404 )
    ( on crate713 pallet713 )
    ( is-crate crate713 )
    ( clear crate713 )
    ( surface-at pallet174 place342 )
    ( surface-at crate174 place342 )
    ( on crate174 pallet174 )
    ( is-crate crate174 )
    ( clear crate174 )
    ( surface-at pallet439 place163 )
    ( surface-at crate439 place163 )
    ( on crate439 pallet439 )
    ( is-crate crate439 )
    ( clear crate439 )
  )
  ( :goal
    ( and
    )
  )
)
