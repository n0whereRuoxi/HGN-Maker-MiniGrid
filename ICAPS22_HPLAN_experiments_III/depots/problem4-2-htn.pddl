( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place83 - place
    hoist83 - hoist
    place571 - place
    hoist571 - hoist
    place791 - place
    hoist791 - hoist
    place564 - place
    hoist564 - hoist
    place929 - place
    hoist929 - hoist
    place0 - place
    hoist0 - hoist
    crate9 - surface
    pallet9 - surface
    crate644 - surface
    pallet644 - surface
    crate621 - surface
    pallet621 - surface
    crate424 - surface
    pallet424 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist83 place83 )
    ( available hoist83 )
    ( hoist-at hoist571 place571 )
    ( available hoist571 )
    ( hoist-at hoist791 place791 )
    ( available hoist791 )
    ( hoist-at hoist564 place564 )
    ( available hoist564 )
    ( hoist-at hoist929 place929 )
    ( available hoist929 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet9 place564 )
    ( surface-at crate9 place564 )
    ( on crate9 pallet9 )
    ( is-crate crate9 )
    ( clear crate9 )
    ( surface-at pallet644 place791 )
    ( surface-at crate644 place791 )
    ( on crate644 pallet644 )
    ( is-crate crate644 )
    ( clear crate644 )
    ( surface-at pallet621 place83 )
    ( surface-at crate621 place83 )
    ( on crate621 pallet621 )
    ( is-crate crate621 )
    ( clear crate621 )
    ( surface-at pallet424 place564 )
    ( surface-at crate424 place564 )
    ( on crate424 pallet424 )
    ( is-crate crate424 )
    ( clear crate424 )
  )
  ( :tasks
    ( Make-4Crate pallet0 crate9 crate644 crate621 crate424 )
  )
)
