( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place597 - place
    hoist597 - hoist
    place924 - place
    hoist924 - hoist
    place450 - place
    hoist450 - hoist
    place525 - place
    hoist525 - hoist
    place3 - place
    hoist3 - hoist
    place0 - place
    hoist0 - hoist
    crate287 - surface
    pallet287 - surface
    crate912 - surface
    pallet912 - surface
    crate555 - surface
    pallet555 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist597 place597 )
    ( available hoist597 )
    ( hoist-at hoist924 place924 )
    ( available hoist924 )
    ( hoist-at hoist450 place450 )
    ( available hoist450 )
    ( hoist-at hoist525 place525 )
    ( available hoist525 )
    ( hoist-at hoist3 place3 )
    ( available hoist3 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet287 place3 )
    ( surface-at crate287 place3 )
    ( on crate287 pallet287 )
    ( is-crate crate287 )
    ( clear crate287 )
    ( surface-at pallet912 place3 )
    ( surface-at crate912 place3 )
    ( on crate912 pallet912 )
    ( is-crate crate912 )
    ( clear crate912 )
    ( surface-at pallet555 place3 )
    ( surface-at crate555 place3 )
    ( on crate555 pallet555 )
    ( is-crate crate555 )
    ( clear crate555 )
  )
  ( :goal
    ( and
    )
  )
)
