( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place507 - place
    hoist507 - hoist
    place733 - place
    hoist733 - hoist
    place403 - place
    hoist403 - hoist
    place23 - place
    hoist23 - hoist
    place0 - place
    hoist0 - hoist
    crate536 - surface
    pallet536 - surface
    crate267 - surface
    pallet267 - surface
    crate430 - surface
    pallet430 - surface
    crate753 - surface
    pallet753 - surface
    crate131 - surface
    pallet131 - surface
    crate709 - surface
    pallet709 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist507 place507 )
    ( available hoist507 )
    ( hoist-at hoist733 place733 )
    ( available hoist733 )
    ( hoist-at hoist403 place403 )
    ( available hoist403 )
    ( hoist-at hoist23 place23 )
    ( available hoist23 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet536 place733 )
    ( surface-at crate536 place733 )
    ( on crate536 pallet536 )
    ( is-crate crate536 )
    ( clear crate536 )
    ( surface-at pallet267 place507 )
    ( surface-at crate267 place507 )
    ( on crate267 pallet267 )
    ( is-crate crate267 )
    ( clear crate267 )
    ( surface-at pallet430 place403 )
    ( surface-at crate430 place403 )
    ( on crate430 pallet430 )
    ( is-crate crate430 )
    ( clear crate430 )
    ( surface-at pallet753 place23 )
    ( surface-at crate753 place23 )
    ( on crate753 pallet753 )
    ( is-crate crate753 )
    ( clear crate753 )
    ( surface-at pallet131 place507 )
    ( surface-at crate131 place507 )
    ( on crate131 pallet131 )
    ( is-crate crate131 )
    ( clear crate131 )
    ( surface-at pallet709 place23 )
    ( surface-at crate709 place23 )
    ( on crate709 pallet709 )
    ( is-crate crate709 )
    ( clear crate709 )
  )
  ( :goal
    ( and
    )
  )
)
