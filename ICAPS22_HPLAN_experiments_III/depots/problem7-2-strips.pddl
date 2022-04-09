( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place659 - place
    hoist659 - hoist
    place757 - place
    hoist757 - hoist
    place105 - place
    hoist105 - hoist
    place501 - place
    hoist501 - hoist
    place37 - place
    hoist37 - hoist
    place801 - place
    hoist801 - hoist
    place265 - place
    hoist265 - hoist
    place450 - place
    hoist450 - hoist
    place227 - place
    hoist227 - hoist
    place0 - place
    hoist0 - hoist
    crate717 - surface
    pallet717 - surface
    crate43 - surface
    pallet43 - surface
    crate493 - surface
    pallet493 - surface
    crate430 - surface
    pallet430 - surface
    crate650 - surface
    pallet650 - surface
    crate698 - surface
    pallet698 - surface
    crate892 - surface
    pallet892 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist659 place659 )
    ( available hoist659 )
    ( hoist-at hoist757 place757 )
    ( available hoist757 )
    ( hoist-at hoist105 place105 )
    ( available hoist105 )
    ( hoist-at hoist501 place501 )
    ( available hoist501 )
    ( hoist-at hoist37 place37 )
    ( available hoist37 )
    ( hoist-at hoist801 place801 )
    ( available hoist801 )
    ( hoist-at hoist265 place265 )
    ( available hoist265 )
    ( hoist-at hoist450 place450 )
    ( available hoist450 )
    ( hoist-at hoist227 place227 )
    ( available hoist227 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet717 place265 )
    ( surface-at crate717 place265 )
    ( on crate717 pallet717 )
    ( is-crate crate717 )
    ( clear crate717 )
    ( surface-at pallet43 place105 )
    ( surface-at crate43 place105 )
    ( on crate43 pallet43 )
    ( is-crate crate43 )
    ( clear crate43 )
    ( surface-at pallet493 place105 )
    ( surface-at crate493 place105 )
    ( on crate493 pallet493 )
    ( is-crate crate493 )
    ( clear crate493 )
    ( surface-at pallet430 place105 )
    ( surface-at crate430 place105 )
    ( on crate430 pallet430 )
    ( is-crate crate430 )
    ( clear crate430 )
    ( surface-at pallet650 place37 )
    ( surface-at crate650 place37 )
    ( on crate650 pallet650 )
    ( is-crate crate650 )
    ( clear crate650 )
    ( surface-at pallet698 place757 )
    ( surface-at crate698 place757 )
    ( on crate698 pallet698 )
    ( is-crate crate698 )
    ( clear crate698 )
    ( surface-at pallet892 place227 )
    ( surface-at crate892 place227 )
    ( on crate892 pallet892 )
    ( is-crate crate892 )
    ( clear crate892 )
  )
  ( :goal
    ( and
    )
  )
)
