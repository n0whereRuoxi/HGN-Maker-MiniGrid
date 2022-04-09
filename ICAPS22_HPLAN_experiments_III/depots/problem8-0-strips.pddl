( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place535 - place
    hoist535 - hoist
    place369 - place
    hoist369 - hoist
    place319 - place
    hoist319 - hoist
    place144 - place
    hoist144 - hoist
    place344 - place
    hoist344 - hoist
    place53 - place
    hoist53 - hoist
    place226 - place
    hoist226 - hoist
    place831 - place
    hoist831 - hoist
    place152 - place
    hoist152 - hoist
    place898 - place
    hoist898 - hoist
    place465 - place
    hoist465 - hoist
    place663 - place
    hoist663 - hoist
    place220 - place
    hoist220 - hoist
    place0 - place
    hoist0 - hoist
    crate706 - surface
    pallet706 - surface
    crate472 - surface
    pallet472 - surface
    crate94 - surface
    pallet94 - surface
    crate557 - surface
    pallet557 - surface
    crate490 - surface
    pallet490 - surface
    crate193 - surface
    pallet193 - surface
    crate996 - surface
    pallet996 - surface
    crate458 - surface
    pallet458 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist535 place535 )
    ( available hoist535 )
    ( hoist-at hoist369 place369 )
    ( available hoist369 )
    ( hoist-at hoist319 place319 )
    ( available hoist319 )
    ( hoist-at hoist144 place144 )
    ( available hoist144 )
    ( hoist-at hoist344 place344 )
    ( available hoist344 )
    ( hoist-at hoist53 place53 )
    ( available hoist53 )
    ( hoist-at hoist226 place226 )
    ( available hoist226 )
    ( hoist-at hoist831 place831 )
    ( available hoist831 )
    ( hoist-at hoist152 place152 )
    ( available hoist152 )
    ( hoist-at hoist898 place898 )
    ( available hoist898 )
    ( hoist-at hoist465 place465 )
    ( available hoist465 )
    ( hoist-at hoist663 place663 )
    ( available hoist663 )
    ( hoist-at hoist220 place220 )
    ( available hoist220 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet706 place535 )
    ( surface-at crate706 place535 )
    ( on crate706 pallet706 )
    ( is-crate crate706 )
    ( clear crate706 )
    ( surface-at pallet472 place319 )
    ( surface-at crate472 place319 )
    ( on crate472 pallet472 )
    ( is-crate crate472 )
    ( clear crate472 )
    ( surface-at pallet94 place663 )
    ( surface-at crate94 place663 )
    ( on crate94 pallet94 )
    ( is-crate crate94 )
    ( clear crate94 )
    ( surface-at pallet557 place535 )
    ( surface-at crate557 place535 )
    ( on crate557 pallet557 )
    ( is-crate crate557 )
    ( clear crate557 )
    ( surface-at pallet490 place344 )
    ( surface-at crate490 place344 )
    ( on crate490 pallet490 )
    ( is-crate crate490 )
    ( clear crate490 )
    ( surface-at pallet193 place53 )
    ( surface-at crate193 place53 )
    ( on crate193 pallet193 )
    ( is-crate crate193 )
    ( clear crate193 )
    ( surface-at pallet996 place344 )
    ( surface-at crate996 place344 )
    ( on crate996 pallet996 )
    ( is-crate crate996 )
    ( clear crate996 )
    ( surface-at pallet458 place319 )
    ( surface-at crate458 place319 )
    ( on crate458 pallet458 )
    ( is-crate crate458 )
    ( clear crate458 )
  )
  ( :goal
    ( and
    )
  )
)
