( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place29 - place
    hoist29 - hoist
    place100 - place
    hoist100 - hoist
    place206 - place
    hoist206 - hoist
    place647 - place
    hoist647 - hoist
    place428 - place
    hoist428 - hoist
    place491 - place
    hoist491 - hoist
    place134 - place
    hoist134 - hoist
    place536 - place
    hoist536 - hoist
    place822 - place
    hoist822 - hoist
    place815 - place
    hoist815 - hoist
    place664 - place
    hoist664 - hoist
    place494 - place
    hoist494 - hoist
    place632 - place
    hoist632 - hoist
    place381 - place
    hoist381 - hoist
    place249 - place
    hoist249 - hoist
    place295 - place
    hoist295 - hoist
    place0 - place
    hoist0 - hoist
    crate54 - surface
    pallet54 - surface
    crate633 - surface
    pallet633 - surface
    crate175 - surface
    pallet175 - surface
    crate315 - surface
    pallet315 - surface
    crate717 - surface
    pallet717 - surface
    crate206 - surface
    pallet206 - surface
    crate426 - surface
    pallet426 - surface
    crate685 - surface
    pallet685 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist29 place29 )
    ( available hoist29 )
    ( hoist-at hoist100 place100 )
    ( available hoist100 )
    ( hoist-at hoist206 place206 )
    ( available hoist206 )
    ( hoist-at hoist647 place647 )
    ( available hoist647 )
    ( hoist-at hoist428 place428 )
    ( available hoist428 )
    ( hoist-at hoist491 place491 )
    ( available hoist491 )
    ( hoist-at hoist134 place134 )
    ( available hoist134 )
    ( hoist-at hoist536 place536 )
    ( available hoist536 )
    ( hoist-at hoist822 place822 )
    ( available hoist822 )
    ( hoist-at hoist815 place815 )
    ( available hoist815 )
    ( hoist-at hoist664 place664 )
    ( available hoist664 )
    ( hoist-at hoist494 place494 )
    ( available hoist494 )
    ( hoist-at hoist632 place632 )
    ( available hoist632 )
    ( hoist-at hoist381 place381 )
    ( available hoist381 )
    ( hoist-at hoist249 place249 )
    ( available hoist249 )
    ( hoist-at hoist295 place295 )
    ( available hoist295 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet54 place647 )
    ( surface-at crate54 place647 )
    ( on crate54 pallet54 )
    ( is-crate crate54 )
    ( clear crate54 )
    ( surface-at pallet633 place29 )
    ( surface-at crate633 place29 )
    ( on crate633 pallet633 )
    ( is-crate crate633 )
    ( clear crate633 )
    ( surface-at pallet175 place206 )
    ( surface-at crate175 place206 )
    ( on crate175 pallet175 )
    ( is-crate crate175 )
    ( clear crate175 )
    ( surface-at pallet315 place664 )
    ( surface-at crate315 place664 )
    ( on crate315 pallet315 )
    ( is-crate crate315 )
    ( clear crate315 )
    ( surface-at pallet717 place428 )
    ( surface-at crate717 place428 )
    ( on crate717 pallet717 )
    ( is-crate crate717 )
    ( clear crate717 )
    ( surface-at pallet206 place632 )
    ( surface-at crate206 place632 )
    ( on crate206 pallet206 )
    ( is-crate crate206 )
    ( clear crate206 )
    ( surface-at pallet426 place664 )
    ( surface-at crate426 place664 )
    ( on crate426 pallet426 )
    ( is-crate crate426 )
    ( clear crate426 )
    ( surface-at pallet685 place206 )
    ( surface-at crate685 place206 )
    ( on crate685 pallet685 )
    ( is-crate crate685 )
    ( clear crate685 )
  )
  ( :goal
    ( and
    )
  )
)
