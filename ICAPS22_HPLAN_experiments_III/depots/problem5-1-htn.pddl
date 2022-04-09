( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place777 - place
    hoist777 - hoist
    place927 - place
    hoist927 - hoist
    place311 - place
    hoist311 - hoist
    place751 - place
    hoist751 - hoist
    place340 - place
    hoist340 - hoist
    place600 - place
    hoist600 - hoist
    place910 - place
    hoist910 - hoist
    place220 - place
    hoist220 - hoist
    place0 - place
    hoist0 - hoist
    crate791 - surface
    pallet791 - surface
    crate489 - surface
    pallet489 - surface
    crate462 - surface
    pallet462 - surface
    crate275 - surface
    pallet275 - surface
    crate911 - surface
    pallet911 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist777 place777 )
    ( available hoist777 )
    ( hoist-at hoist927 place927 )
    ( available hoist927 )
    ( hoist-at hoist311 place311 )
    ( available hoist311 )
    ( hoist-at hoist751 place751 )
    ( available hoist751 )
    ( hoist-at hoist340 place340 )
    ( available hoist340 )
    ( hoist-at hoist600 place600 )
    ( available hoist600 )
    ( hoist-at hoist910 place910 )
    ( available hoist910 )
    ( hoist-at hoist220 place220 )
    ( available hoist220 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet791 place751 )
    ( surface-at crate791 place751 )
    ( on crate791 pallet791 )
    ( is-crate crate791 )
    ( clear crate791 )
    ( surface-at pallet489 place910 )
    ( surface-at crate489 place910 )
    ( on crate489 pallet489 )
    ( is-crate crate489 )
    ( clear crate489 )
    ( surface-at pallet462 place751 )
    ( surface-at crate462 place751 )
    ( on crate462 pallet462 )
    ( is-crate crate462 )
    ( clear crate462 )
    ( surface-at pallet275 place600 )
    ( surface-at crate275 place600 )
    ( on crate275 pallet275 )
    ( is-crate crate275 )
    ( clear crate275 )
    ( surface-at pallet911 place751 )
    ( surface-at crate911 place751 )
    ( on crate911 pallet911 )
    ( is-crate crate911 )
    ( clear crate911 )
  )
  ( :tasks
    ( Make-5Crate pallet0 crate791 crate489 crate462 crate275 crate911 )
  )
)
