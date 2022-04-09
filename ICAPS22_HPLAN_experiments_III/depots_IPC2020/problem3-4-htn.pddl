( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place458 - place
    hoist458 - hoist
    place735 - place
    hoist735 - hoist
    place583 - place
    hoist583 - hoist
    place195 - place
    hoist195 - hoist
    place0 - place
    hoist0 - hoist
    crate540 - surface
    pallet540 - surface
    crate810 - surface
    pallet810 - surface
    crate912 - surface
    pallet912 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist458 place458 )
    ( available hoist458 )
    ( hoist-at hoist735 place735 )
    ( available hoist735 )
    ( hoist-at hoist583 place583 )
    ( available hoist583 )
    ( hoist-at hoist195 place195 )
    ( available hoist195 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet540 place195 )
    ( surface-at crate540 place195 )
    ( on crate540 pallet540 )
    ( is-crate crate540 )
    ( clear crate540 )
    ( surface-at pallet810 place583 )
    ( surface-at crate810 place583 )
    ( on crate810 pallet810 )
    ( is-crate crate810 )
    ( clear crate810 )
    ( surface-at pallet912 place195 )
    ( surface-at crate912 place195 )
    ( on crate912 pallet912 )
    ( is-crate crate912 )
    ( clear crate912 )
  )
  ( :tasks
    ( Make-3Crate pallet0 crate540 crate810 crate912 )
  )
)
