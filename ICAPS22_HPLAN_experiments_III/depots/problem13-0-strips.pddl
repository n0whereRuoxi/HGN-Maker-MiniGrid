( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place574 - place
    hoist574 - hoist
    place581 - place
    hoist581 - hoist
    place433 - place
    hoist433 - hoist
    place922 - place
    hoist922 - hoist
    place874 - place
    hoist874 - hoist
    place791 - place
    hoist791 - hoist
    place747 - place
    hoist747 - hoist
    place424 - place
    hoist424 - hoist
    place793 - place
    hoist793 - hoist
    place396 - place
    hoist396 - hoist
    place439 - place
    hoist439 - hoist
    place420 - place
    hoist420 - hoist
    place971 - place
    hoist971 - hoist
    place583 - place
    hoist583 - hoist
    place996 - place
    hoist996 - hoist
    place646 - place
    hoist646 - hoist
    place0 - place
    hoist0 - hoist
    crate633 - surface
    pallet633 - surface
    crate801 - surface
    pallet801 - surface
    crate285 - surface
    pallet285 - surface
    crate805 - surface
    pallet805 - surface
    crate718 - surface
    pallet718 - surface
    crate589 - surface
    pallet589 - surface
    crate154 - surface
    pallet154 - surface
    crate341 - surface
    pallet341 - surface
    crate169 - surface
    pallet169 - surface
    crate244 - surface
    pallet244 - surface
    crate717 - surface
    pallet717 - surface
    crate486 - surface
    pallet486 - surface
    crate910 - surface
    pallet910 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist574 place574 )
    ( available hoist574 )
    ( hoist-at hoist581 place581 )
    ( available hoist581 )
    ( hoist-at hoist433 place433 )
    ( available hoist433 )
    ( hoist-at hoist922 place922 )
    ( available hoist922 )
    ( hoist-at hoist874 place874 )
    ( available hoist874 )
    ( hoist-at hoist791 place791 )
    ( available hoist791 )
    ( hoist-at hoist747 place747 )
    ( available hoist747 )
    ( hoist-at hoist424 place424 )
    ( available hoist424 )
    ( hoist-at hoist793 place793 )
    ( available hoist793 )
    ( hoist-at hoist396 place396 )
    ( available hoist396 )
    ( hoist-at hoist439 place439 )
    ( available hoist439 )
    ( hoist-at hoist420 place420 )
    ( available hoist420 )
    ( hoist-at hoist971 place971 )
    ( available hoist971 )
    ( hoist-at hoist583 place583 )
    ( available hoist583 )
    ( hoist-at hoist996 place996 )
    ( available hoist996 )
    ( hoist-at hoist646 place646 )
    ( available hoist646 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet633 place874 )
    ( surface-at crate633 place874 )
    ( on crate633 pallet633 )
    ( is-crate crate633 )
    ( clear crate633 )
    ( surface-at pallet801 place424 )
    ( surface-at crate801 place424 )
    ( on crate801 pallet801 )
    ( is-crate crate801 )
    ( clear crate801 )
    ( surface-at pallet285 place583 )
    ( surface-at crate285 place583 )
    ( on crate285 pallet285 )
    ( is-crate crate285 )
    ( clear crate285 )
    ( surface-at pallet805 place439 )
    ( surface-at crate805 place439 )
    ( on crate805 pallet805 )
    ( is-crate crate805 )
    ( clear crate805 )
    ( surface-at pallet718 place439 )
    ( surface-at crate718 place439 )
    ( on crate718 pallet718 )
    ( is-crate crate718 )
    ( clear crate718 )
    ( surface-at pallet589 place420 )
    ( surface-at crate589 place420 )
    ( on crate589 pallet589 )
    ( is-crate crate589 )
    ( clear crate589 )
    ( surface-at pallet154 place747 )
    ( surface-at crate154 place747 )
    ( on crate154 pallet154 )
    ( is-crate crate154 )
    ( clear crate154 )
    ( surface-at pallet341 place791 )
    ( surface-at crate341 place791 )
    ( on crate341 pallet341 )
    ( is-crate crate341 )
    ( clear crate341 )
    ( surface-at pallet169 place793 )
    ( surface-at crate169 place793 )
    ( on crate169 pallet169 )
    ( is-crate crate169 )
    ( clear crate169 )
    ( surface-at pallet244 place396 )
    ( surface-at crate244 place396 )
    ( on crate244 pallet244 )
    ( is-crate crate244 )
    ( clear crate244 )
    ( surface-at pallet717 place424 )
    ( surface-at crate717 place424 )
    ( on crate717 pallet717 )
    ( is-crate crate717 )
    ( clear crate717 )
    ( surface-at pallet486 place874 )
    ( surface-at crate486 place874 )
    ( on crate486 pallet486 )
    ( is-crate crate486 )
    ( clear crate486 )
    ( surface-at pallet910 place996 )
    ( surface-at crate910 place996 )
    ( on crate910 pallet910 )
    ( is-crate crate910 )
    ( clear crate910 )
  )
  ( :goal
    ( and
    )
  )
)
