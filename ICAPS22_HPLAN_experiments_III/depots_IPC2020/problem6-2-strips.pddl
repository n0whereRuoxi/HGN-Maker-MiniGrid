( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place97 - place
    hoist97 - hoist
    place539 - place
    hoist539 - hoist
    place540 - place
    hoist540 - hoist
    place218 - place
    hoist218 - hoist
    place0 - place
    hoist0 - hoist
    crate894 - surface
    pallet894 - surface
    crate367 - surface
    pallet367 - surface
    crate558 - surface
    pallet558 - surface
    crate700 - surface
    pallet700 - surface
    crate716 - surface
    pallet716 - surface
    crate535 - surface
    pallet535 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist97 place97 )
    ( available hoist97 )
    ( hoist-at hoist539 place539 )
    ( available hoist539 )
    ( hoist-at hoist540 place540 )
    ( available hoist540 )
    ( hoist-at hoist218 place218 )
    ( available hoist218 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet894 place97 )
    ( surface-at crate894 place97 )
    ( on crate894 pallet894 )
    ( is-crate crate894 )
    ( clear crate894 )
    ( surface-at pallet367 place218 )
    ( surface-at crate367 place218 )
    ( on crate367 pallet367 )
    ( is-crate crate367 )
    ( clear crate367 )
    ( surface-at pallet558 place540 )
    ( surface-at crate558 place540 )
    ( on crate558 pallet558 )
    ( is-crate crate558 )
    ( clear crate558 )
    ( surface-at pallet700 place539 )
    ( surface-at crate700 place539 )
    ( on crate700 pallet700 )
    ( is-crate crate700 )
    ( clear crate700 )
    ( surface-at pallet716 place540 )
    ( surface-at crate716 place540 )
    ( on crate716 pallet716 )
    ( is-crate crate716 )
    ( clear crate716 )
    ( surface-at pallet535 place218 )
    ( surface-at crate535 place218 )
    ( on crate535 pallet535 )
    ( is-crate crate535 )
    ( clear crate535 )
  )
  ( :goal
    ( and
    )
  )
)
