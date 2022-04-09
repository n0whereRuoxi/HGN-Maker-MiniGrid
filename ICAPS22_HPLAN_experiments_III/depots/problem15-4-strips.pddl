( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place16 - place
    hoist16 - hoist
    place177 - place
    hoist177 - hoist
    place700 - place
    hoist700 - hoist
    place643 - place
    hoist643 - hoist
    place983 - place
    hoist983 - hoist
    place859 - place
    hoist859 - hoist
    place31 - place
    hoist31 - hoist
    place93 - place
    hoist93 - hoist
    place0 - place
    hoist0 - hoist
    crate388 - surface
    pallet388 - surface
    crate869 - surface
    pallet869 - surface
    crate801 - surface
    pallet801 - surface
    crate493 - surface
    pallet493 - surface
    crate893 - surface
    pallet893 - surface
    crate13 - surface
    pallet13 - surface
    crate723 - surface
    pallet723 - surface
    crate468 - surface
    pallet468 - surface
    crate11 - surface
    pallet11 - surface
    crate130 - surface
    pallet130 - surface
    crate911 - surface
    pallet911 - surface
    crate416 - surface
    pallet416 - surface
    crate476 - surface
    pallet476 - surface
    crate291 - surface
    pallet291 - surface
    crate462 - surface
    pallet462 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist16 place16 )
    ( available hoist16 )
    ( hoist-at hoist177 place177 )
    ( available hoist177 )
    ( hoist-at hoist700 place700 )
    ( available hoist700 )
    ( hoist-at hoist643 place643 )
    ( available hoist643 )
    ( hoist-at hoist983 place983 )
    ( available hoist983 )
    ( hoist-at hoist859 place859 )
    ( available hoist859 )
    ( hoist-at hoist31 place31 )
    ( available hoist31 )
    ( hoist-at hoist93 place93 )
    ( available hoist93 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet388 place700 )
    ( surface-at crate388 place700 )
    ( on crate388 pallet388 )
    ( is-crate crate388 )
    ( clear crate388 )
    ( surface-at pallet869 place643 )
    ( surface-at crate869 place643 )
    ( on crate869 pallet869 )
    ( is-crate crate869 )
    ( clear crate869 )
    ( surface-at pallet801 place93 )
    ( surface-at crate801 place93 )
    ( on crate801 pallet801 )
    ( is-crate crate801 )
    ( clear crate801 )
    ( surface-at pallet493 place177 )
    ( surface-at crate493 place177 )
    ( on crate493 pallet493 )
    ( is-crate crate493 )
    ( clear crate493 )
    ( surface-at pallet893 place859 )
    ( surface-at crate893 place859 )
    ( on crate893 pallet893 )
    ( is-crate crate893 )
    ( clear crate893 )
    ( surface-at pallet13 place31 )
    ( surface-at crate13 place31 )
    ( on crate13 pallet13 )
    ( is-crate crate13 )
    ( clear crate13 )
    ( surface-at pallet723 place93 )
    ( surface-at crate723 place93 )
    ( on crate723 pallet723 )
    ( is-crate crate723 )
    ( clear crate723 )
    ( surface-at pallet468 place700 )
    ( surface-at crate468 place700 )
    ( on crate468 pallet468 )
    ( is-crate crate468 )
    ( clear crate468 )
    ( surface-at pallet11 place93 )
    ( surface-at crate11 place93 )
    ( on crate11 pallet11 )
    ( is-crate crate11 )
    ( clear crate11 )
    ( surface-at pallet130 place983 )
    ( surface-at crate130 place983 )
    ( on crate130 pallet130 )
    ( is-crate crate130 )
    ( clear crate130 )
    ( surface-at pallet911 place93 )
    ( surface-at crate911 place93 )
    ( on crate911 pallet911 )
    ( is-crate crate911 )
    ( clear crate911 )
    ( surface-at pallet416 place177 )
    ( surface-at crate416 place177 )
    ( on crate416 pallet416 )
    ( is-crate crate416 )
    ( clear crate416 )
    ( surface-at pallet476 place177 )
    ( surface-at crate476 place177 )
    ( on crate476 pallet476 )
    ( is-crate crate476 )
    ( clear crate476 )
    ( surface-at pallet291 place177 )
    ( surface-at crate291 place177 )
    ( on crate291 pallet291 )
    ( is-crate crate291 )
    ( clear crate291 )
    ( surface-at pallet462 place700 )
    ( surface-at crate462 place700 )
    ( on crate462 pallet462 )
    ( is-crate crate462 )
    ( clear crate462 )
  )
  ( :goal
    ( and
    )
  )
)
