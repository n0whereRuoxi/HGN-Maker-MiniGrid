( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place412 - place
    hoist412 - hoist
    place543 - place
    hoist543 - hoist
    place85 - place
    hoist85 - hoist
    place415 - place
    hoist415 - hoist
    place470 - place
    hoist470 - hoist
    place357 - place
    hoist357 - hoist
    place203 - place
    hoist203 - hoist
    place237 - place
    hoist237 - hoist
    place830 - place
    hoist830 - hoist
    place0 - place
    hoist0 - hoist
    crate79 - surface
    pallet79 - surface
    crate615 - surface
    pallet615 - surface
    crate437 - surface
    pallet437 - surface
    crate520 - surface
    pallet520 - surface
    crate582 - surface
    pallet582 - surface
    crate156 - surface
    pallet156 - surface
    crate200 - surface
    pallet200 - surface
    crate770 - surface
    pallet770 - surface
    crate336 - surface
    pallet336 - surface
    crate820 - surface
    pallet820 - surface
    crate622 - surface
    pallet622 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist412 place412 )
    ( available hoist412 )
    ( hoist-at hoist543 place543 )
    ( available hoist543 )
    ( hoist-at hoist85 place85 )
    ( available hoist85 )
    ( hoist-at hoist415 place415 )
    ( available hoist415 )
    ( hoist-at hoist470 place470 )
    ( available hoist470 )
    ( hoist-at hoist357 place357 )
    ( available hoist357 )
    ( hoist-at hoist203 place203 )
    ( available hoist203 )
    ( hoist-at hoist237 place237 )
    ( available hoist237 )
    ( hoist-at hoist830 place830 )
    ( available hoist830 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet79 place357 )
    ( surface-at crate79 place357 )
    ( on crate79 pallet79 )
    ( is-crate crate79 )
    ( clear crate79 )
    ( surface-at pallet615 place470 )
    ( surface-at crate615 place470 )
    ( on crate615 pallet615 )
    ( is-crate crate615 )
    ( clear crate615 )
    ( surface-at pallet437 place543 )
    ( surface-at crate437 place543 )
    ( on crate437 pallet437 )
    ( is-crate crate437 )
    ( clear crate437 )
    ( surface-at pallet520 place830 )
    ( surface-at crate520 place830 )
    ( on crate520 pallet520 )
    ( is-crate crate520 )
    ( clear crate520 )
    ( surface-at pallet582 place543 )
    ( surface-at crate582 place543 )
    ( on crate582 pallet582 )
    ( is-crate crate582 )
    ( clear crate582 )
    ( surface-at pallet156 place357 )
    ( surface-at crate156 place357 )
    ( on crate156 pallet156 )
    ( is-crate crate156 )
    ( clear crate156 )
    ( surface-at pallet200 place830 )
    ( surface-at crate200 place830 )
    ( on crate200 pallet200 )
    ( is-crate crate200 )
    ( clear crate200 )
    ( surface-at pallet770 place415 )
    ( surface-at crate770 place415 )
    ( on crate770 pallet770 )
    ( is-crate crate770 )
    ( clear crate770 )
    ( surface-at pallet336 place412 )
    ( surface-at crate336 place412 )
    ( on crate336 pallet336 )
    ( is-crate crate336 )
    ( clear crate336 )
    ( surface-at pallet820 place543 )
    ( surface-at crate820 place543 )
    ( on crate820 pallet820 )
    ( is-crate crate820 )
    ( clear crate820 )
    ( surface-at pallet622 place412 )
    ( surface-at crate622 place412 )
    ( on crate622 pallet622 )
    ( is-crate crate622 )
    ( clear crate622 )
  )
  ( :goal
    ( and
    )
  )
)
