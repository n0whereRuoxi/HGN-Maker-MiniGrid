( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place888 - place
    hoist888 - hoist
    place526 - place
    hoist526 - hoist
    place522 - place
    hoist522 - hoist
    place735 - place
    hoist735 - hoist
    place222 - place
    hoist222 - hoist
    place645 - place
    hoist645 - hoist
    place467 - place
    hoist467 - hoist
    place0 - place
    hoist0 - hoist
    crate383 - surface
    pallet383 - surface
    crate923 - surface
    pallet923 - surface
    crate573 - surface
    pallet573 - surface
    crate131 - surface
    pallet131 - surface
    crate652 - surface
    pallet652 - surface
    crate231 - surface
    pallet231 - surface
    crate404 - surface
    pallet404 - surface
    crate486 - surface
    pallet486 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist888 place888 )
    ( available hoist888 )
    ( hoist-at hoist526 place526 )
    ( available hoist526 )
    ( hoist-at hoist522 place522 )
    ( available hoist522 )
    ( hoist-at hoist735 place735 )
    ( available hoist735 )
    ( hoist-at hoist222 place222 )
    ( available hoist222 )
    ( hoist-at hoist645 place645 )
    ( available hoist645 )
    ( hoist-at hoist467 place467 )
    ( available hoist467 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet383 place522 )
    ( surface-at crate383 place522 )
    ( on crate383 pallet383 )
    ( is-crate crate383 )
    ( clear crate383 )
    ( surface-at pallet923 place222 )
    ( surface-at crate923 place222 )
    ( on crate923 pallet923 )
    ( is-crate crate923 )
    ( clear crate923 )
    ( surface-at pallet573 place467 )
    ( surface-at crate573 place467 )
    ( on crate573 pallet573 )
    ( is-crate crate573 )
    ( clear crate573 )
    ( surface-at pallet131 place645 )
    ( surface-at crate131 place645 )
    ( on crate131 pallet131 )
    ( is-crate crate131 )
    ( clear crate131 )
    ( surface-at pallet652 place735 )
    ( surface-at crate652 place735 )
    ( on crate652 pallet652 )
    ( is-crate crate652 )
    ( clear crate652 )
    ( surface-at pallet231 place522 )
    ( surface-at crate231 place522 )
    ( on crate231 pallet231 )
    ( is-crate crate231 )
    ( clear crate231 )
    ( surface-at pallet404 place735 )
    ( surface-at crate404 place735 )
    ( on crate404 pallet404 )
    ( is-crate crate404 )
    ( clear crate404 )
    ( surface-at pallet486 place526 )
    ( surface-at crate486 place526 )
    ( on crate486 pallet486 )
    ( is-crate crate486 )
    ( clear crate486 )
  )
  ( :goal
    ( and
    )
  )
)
