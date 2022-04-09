( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place642 - place
    hoist642 - hoist
    place223 - place
    hoist223 - hoist
    place691 - place
    hoist691 - hoist
    place57 - place
    hoist57 - hoist
    place623 - place
    hoist623 - hoist
    place267 - place
    hoist267 - hoist
    place485 - place
    hoist485 - hoist
    place354 - place
    hoist354 - hoist
    place693 - place
    hoist693 - hoist
    place759 - place
    hoist759 - hoist
    place0 - place
    hoist0 - hoist
    crate722 - surface
    pallet722 - surface
    crate260 - surface
    pallet260 - surface
    crate849 - surface
    pallet849 - surface
    crate288 - surface
    pallet288 - surface
    crate276 - surface
    pallet276 - surface
    crate379 - surface
    pallet379 - surface
    crate231 - surface
    pallet231 - surface
    crate253 - surface
    pallet253 - surface
    crate100 - surface
    pallet100 - surface
    crate27 - surface
    pallet27 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist642 place642 )
    ( available hoist642 )
    ( hoist-at hoist223 place223 )
    ( available hoist223 )
    ( hoist-at hoist691 place691 )
    ( available hoist691 )
    ( hoist-at hoist57 place57 )
    ( available hoist57 )
    ( hoist-at hoist623 place623 )
    ( available hoist623 )
    ( hoist-at hoist267 place267 )
    ( available hoist267 )
    ( hoist-at hoist485 place485 )
    ( available hoist485 )
    ( hoist-at hoist354 place354 )
    ( available hoist354 )
    ( hoist-at hoist693 place693 )
    ( available hoist693 )
    ( hoist-at hoist759 place759 )
    ( available hoist759 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet722 place57 )
    ( surface-at crate722 place57 )
    ( on crate722 pallet722 )
    ( is-crate crate722 )
    ( clear crate722 )
    ( surface-at pallet260 place267 )
    ( surface-at crate260 place267 )
    ( on crate260 pallet260 )
    ( is-crate crate260 )
    ( clear crate260 )
    ( surface-at pallet849 place623 )
    ( surface-at crate849 place623 )
    ( on crate849 pallet849 )
    ( is-crate crate849 )
    ( clear crate849 )
    ( surface-at pallet288 place759 )
    ( surface-at crate288 place759 )
    ( on crate288 pallet288 )
    ( is-crate crate288 )
    ( clear crate288 )
    ( surface-at pallet276 place57 )
    ( surface-at crate276 place57 )
    ( on crate276 pallet276 )
    ( is-crate crate276 )
    ( clear crate276 )
    ( surface-at pallet379 place485 )
    ( surface-at crate379 place485 )
    ( on crate379 pallet379 )
    ( is-crate crate379 )
    ( clear crate379 )
    ( surface-at pallet231 place623 )
    ( surface-at crate231 place623 )
    ( on crate231 pallet231 )
    ( is-crate crate231 )
    ( clear crate231 )
    ( surface-at pallet253 place485 )
    ( surface-at crate253 place485 )
    ( on crate253 pallet253 )
    ( is-crate crate253 )
    ( clear crate253 )
    ( surface-at pallet100 place57 )
    ( surface-at crate100 place57 )
    ( on crate100 pallet100 )
    ( is-crate crate100 )
    ( clear crate100 )
    ( surface-at pallet27 place57 )
    ( surface-at crate27 place57 )
    ( on crate27 pallet27 )
    ( is-crate crate27 )
    ( clear crate27 )
  )
  ( :goal
    ( and
    )
  )
)
