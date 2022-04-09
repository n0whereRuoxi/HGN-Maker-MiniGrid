( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place556 - place
    hoist556 - hoist
    place403 - place
    hoist403 - hoist
    place31 - place
    hoist31 - hoist
    place572 - place
    hoist572 - hoist
    place40 - place
    hoist40 - hoist
    place240 - place
    hoist240 - hoist
    place21 - place
    hoist21 - hoist
    place34 - place
    hoist34 - hoist
    place399 - place
    hoist399 - hoist
    place998 - place
    hoist998 - hoist
    place413 - place
    hoist413 - hoist
    place105 - place
    hoist105 - hoist
    place324 - place
    hoist324 - hoist
    place824 - place
    hoist824 - hoist
    place802 - place
    hoist802 - hoist
    place0 - place
    hoist0 - hoist
    crate334 - surface
    pallet334 - surface
    crate190 - surface
    pallet190 - surface
    crate791 - surface
    pallet791 - surface
    crate908 - surface
    pallet908 - surface
    crate721 - surface
    pallet721 - surface
    crate90 - surface
    pallet90 - surface
    crate458 - surface
    pallet458 - surface
    crate775 - surface
    pallet775 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist556 place556 )
    ( available hoist556 )
    ( hoist-at hoist403 place403 )
    ( available hoist403 )
    ( hoist-at hoist31 place31 )
    ( available hoist31 )
    ( hoist-at hoist572 place572 )
    ( available hoist572 )
    ( hoist-at hoist40 place40 )
    ( available hoist40 )
    ( hoist-at hoist240 place240 )
    ( available hoist240 )
    ( hoist-at hoist21 place21 )
    ( available hoist21 )
    ( hoist-at hoist34 place34 )
    ( available hoist34 )
    ( hoist-at hoist399 place399 )
    ( available hoist399 )
    ( hoist-at hoist998 place998 )
    ( available hoist998 )
    ( hoist-at hoist413 place413 )
    ( available hoist413 )
    ( hoist-at hoist105 place105 )
    ( available hoist105 )
    ( hoist-at hoist324 place324 )
    ( available hoist324 )
    ( hoist-at hoist824 place824 )
    ( available hoist824 )
    ( hoist-at hoist802 place802 )
    ( available hoist802 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet334 place413 )
    ( surface-at crate334 place413 )
    ( on crate334 pallet334 )
    ( is-crate crate334 )
    ( clear crate334 )
    ( surface-at pallet190 place240 )
    ( surface-at crate190 place240 )
    ( on crate190 pallet190 )
    ( is-crate crate190 )
    ( clear crate190 )
    ( surface-at pallet791 place40 )
    ( surface-at crate791 place40 )
    ( on crate791 pallet791 )
    ( is-crate crate791 )
    ( clear crate791 )
    ( surface-at pallet908 place34 )
    ( surface-at crate908 place34 )
    ( on crate908 pallet908 )
    ( is-crate crate908 )
    ( clear crate908 )
    ( surface-at pallet721 place240 )
    ( surface-at crate721 place240 )
    ( on crate721 pallet721 )
    ( is-crate crate721 )
    ( clear crate721 )
    ( surface-at pallet90 place324 )
    ( surface-at crate90 place324 )
    ( on crate90 pallet90 )
    ( is-crate crate90 )
    ( clear crate90 )
    ( surface-at pallet458 place403 )
    ( surface-at crate458 place403 )
    ( on crate458 pallet458 )
    ( is-crate crate458 )
    ( clear crate458 )
    ( surface-at pallet775 place21 )
    ( surface-at crate775 place21 )
    ( on crate775 pallet775 )
    ( is-crate crate775 )
    ( clear crate775 )
  )
  ( :goal
    ( and
    )
  )
)
