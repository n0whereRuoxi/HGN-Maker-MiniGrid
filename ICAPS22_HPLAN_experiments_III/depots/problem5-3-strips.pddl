( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place559 - place
    hoist559 - hoist
    place427 - place
    hoist427 - hoist
    place837 - place
    hoist837 - hoist
    place17 - place
    hoist17 - hoist
    place351 - place
    hoist351 - hoist
    place0 - place
    hoist0 - hoist
    crate280 - surface
    pallet280 - surface
    crate173 - surface
    pallet173 - surface
    crate995 - surface
    pallet995 - surface
    crate829 - surface
    pallet829 - surface
    crate900 - surface
    pallet900 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist559 place559 )
    ( available hoist559 )
    ( hoist-at hoist427 place427 )
    ( available hoist427 )
    ( hoist-at hoist837 place837 )
    ( available hoist837 )
    ( hoist-at hoist17 place17 )
    ( available hoist17 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet280 place427 )
    ( surface-at crate280 place427 )
    ( on crate280 pallet280 )
    ( is-crate crate280 )
    ( clear crate280 )
    ( surface-at pallet173 place559 )
    ( surface-at crate173 place559 )
    ( on crate173 pallet173 )
    ( is-crate crate173 )
    ( clear crate173 )
    ( surface-at pallet995 place427 )
    ( surface-at crate995 place427 )
    ( on crate995 pallet995 )
    ( is-crate crate995 )
    ( clear crate995 )
    ( surface-at pallet829 place427 )
    ( surface-at crate829 place427 )
    ( on crate829 pallet829 )
    ( is-crate crate829 )
    ( clear crate829 )
    ( surface-at pallet900 place559 )
    ( surface-at crate900 place559 )
    ( on crate900 pallet900 )
    ( is-crate crate900 )
    ( clear crate900 )
  )
  ( :goal
    ( and
    )
  )
)
