( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place352 - place
    hoist352 - hoist
    place367 - place
    hoist367 - hoist
    place636 - place
    hoist636 - hoist
    place764 - place
    hoist764 - hoist
    place359 - place
    hoist359 - hoist
    place465 - place
    hoist465 - hoist
    place0 - place
    hoist0 - hoist
    crate96 - surface
    pallet96 - surface
    crate465 - surface
    pallet465 - surface
    crate479 - surface
    pallet479 - surface
    crate400 - surface
    pallet400 - surface
    crate469 - surface
    pallet469 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist352 place352 )
    ( available hoist352 )
    ( hoist-at hoist367 place367 )
    ( available hoist367 )
    ( hoist-at hoist636 place636 )
    ( available hoist636 )
    ( hoist-at hoist764 place764 )
    ( available hoist764 )
    ( hoist-at hoist359 place359 )
    ( available hoist359 )
    ( hoist-at hoist465 place465 )
    ( available hoist465 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet96 place359 )
    ( surface-at crate96 place359 )
    ( on crate96 pallet96 )
    ( is-crate crate96 )
    ( clear crate96 )
    ( surface-at pallet465 place465 )
    ( surface-at crate465 place465 )
    ( on crate465 pallet465 )
    ( is-crate crate465 )
    ( clear crate465 )
    ( surface-at pallet479 place367 )
    ( surface-at crate479 place367 )
    ( on crate479 pallet479 )
    ( is-crate crate479 )
    ( clear crate479 )
    ( surface-at pallet400 place367 )
    ( surface-at crate400 place367 )
    ( on crate400 pallet400 )
    ( is-crate crate400 )
    ( clear crate400 )
    ( surface-at pallet469 place359 )
    ( surface-at crate469 place359 )
    ( on crate469 pallet469 )
    ( is-crate crate469 )
    ( clear crate469 )
  )
  ( :tasks
    ( Make-5Crate pallet0 crate96 crate465 crate479 crate400 crate469 )
  )
)
