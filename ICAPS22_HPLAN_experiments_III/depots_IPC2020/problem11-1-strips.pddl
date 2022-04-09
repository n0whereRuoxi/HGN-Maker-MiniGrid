( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place499 - place
    hoist499 - hoist
    place195 - place
    hoist195 - hoist
    place651 - place
    hoist651 - hoist
    place557 - place
    hoist557 - hoist
    place920 - place
    hoist920 - hoist
    place644 - place
    hoist644 - hoist
    place163 - place
    hoist163 - hoist
    place364 - place
    hoist364 - hoist
    place808 - place
    hoist808 - hoist
    place622 - place
    hoist622 - hoist
    place983 - place
    hoist983 - hoist
    place739 - place
    hoist739 - hoist
    place38 - place
    hoist38 - hoist
    place612 - place
    hoist612 - hoist
    place594 - place
    hoist594 - hoist
    place794 - place
    hoist794 - hoist
    place368 - place
    hoist368 - hoist
    place252 - place
    hoist252 - hoist
    place314 - place
    hoist314 - hoist
    place0 - place
    hoist0 - hoist
    crate384 - surface
    pallet384 - surface
    crate191 - surface
    pallet191 - surface
    crate603 - surface
    pallet603 - surface
    crate876 - surface
    pallet876 - surface
    crate194 - surface
    pallet194 - surface
    crate840 - surface
    pallet840 - surface
    crate921 - surface
    pallet921 - surface
    crate27 - surface
    pallet27 - surface
    crate101 - surface
    pallet101 - surface
    crate757 - surface
    pallet757 - surface
    crate31 - surface
    pallet31 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist499 place499 )
    ( available hoist499 )
    ( hoist-at hoist195 place195 )
    ( available hoist195 )
    ( hoist-at hoist651 place651 )
    ( available hoist651 )
    ( hoist-at hoist557 place557 )
    ( available hoist557 )
    ( hoist-at hoist920 place920 )
    ( available hoist920 )
    ( hoist-at hoist644 place644 )
    ( available hoist644 )
    ( hoist-at hoist163 place163 )
    ( available hoist163 )
    ( hoist-at hoist364 place364 )
    ( available hoist364 )
    ( hoist-at hoist808 place808 )
    ( available hoist808 )
    ( hoist-at hoist622 place622 )
    ( available hoist622 )
    ( hoist-at hoist983 place983 )
    ( available hoist983 )
    ( hoist-at hoist739 place739 )
    ( available hoist739 )
    ( hoist-at hoist38 place38 )
    ( available hoist38 )
    ( hoist-at hoist612 place612 )
    ( available hoist612 )
    ( hoist-at hoist594 place594 )
    ( available hoist594 )
    ( hoist-at hoist794 place794 )
    ( available hoist794 )
    ( hoist-at hoist368 place368 )
    ( available hoist368 )
    ( hoist-at hoist252 place252 )
    ( available hoist252 )
    ( hoist-at hoist314 place314 )
    ( available hoist314 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet384 place920 )
    ( surface-at crate384 place920 )
    ( on crate384 pallet384 )
    ( is-crate crate384 )
    ( clear crate384 )
    ( surface-at pallet191 place368 )
    ( surface-at crate191 place368 )
    ( on crate191 pallet191 )
    ( is-crate crate191 )
    ( clear crate191 )
    ( surface-at pallet603 place644 )
    ( surface-at crate603 place644 )
    ( on crate603 pallet603 )
    ( is-crate crate603 )
    ( clear crate603 )
    ( surface-at pallet876 place314 )
    ( surface-at crate876 place314 )
    ( on crate876 pallet876 )
    ( is-crate crate876 )
    ( clear crate876 )
    ( surface-at pallet194 place644 )
    ( surface-at crate194 place644 )
    ( on crate194 pallet194 )
    ( is-crate crate194 )
    ( clear crate194 )
    ( surface-at pallet840 place368 )
    ( surface-at crate840 place368 )
    ( on crate840 pallet840 )
    ( is-crate crate840 )
    ( clear crate840 )
    ( surface-at pallet921 place808 )
    ( surface-at crate921 place808 )
    ( on crate921 pallet921 )
    ( is-crate crate921 )
    ( clear crate921 )
    ( surface-at pallet27 place739 )
    ( surface-at crate27 place739 )
    ( on crate27 pallet27 )
    ( is-crate crate27 )
    ( clear crate27 )
    ( surface-at pallet101 place252 )
    ( surface-at crate101 place252 )
    ( on crate101 pallet101 )
    ( is-crate crate101 )
    ( clear crate101 )
    ( surface-at pallet757 place368 )
    ( surface-at crate757 place368 )
    ( on crate757 pallet757 )
    ( is-crate crate757 )
    ( clear crate757 )
    ( surface-at pallet31 place920 )
    ( surface-at crate31 place920 )
    ( on crate31 pallet31 )
    ( is-crate crate31 )
    ( clear crate31 )
  )
  ( :goal
    ( and
    )
  )
)
