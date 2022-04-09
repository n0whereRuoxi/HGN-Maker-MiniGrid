( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place350 - place
    hoist350 - hoist
    place737 - place
    hoist737 - hoist
    place266 - place
    hoist266 - hoist
    place926 - place
    hoist926 - hoist
    place845 - place
    hoist845 - hoist
    place545 - place
    hoist545 - hoist
    place571 - place
    hoist571 - hoist
    place183 - place
    hoist183 - hoist
    place121 - place
    hoist121 - hoist
    place0 - place
    hoist0 - hoist
    crate397 - surface
    pallet397 - surface
    crate304 - surface
    pallet304 - surface
    crate567 - surface
    pallet567 - surface
    crate244 - surface
    pallet244 - surface
    crate376 - surface
    pallet376 - surface
    crate438 - surface
    pallet438 - surface
    crate908 - surface
    pallet908 - surface
    crate770 - surface
    pallet770 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist350 place350 )
    ( available hoist350 )
    ( hoist-at hoist737 place737 )
    ( available hoist737 )
    ( hoist-at hoist266 place266 )
    ( available hoist266 )
    ( hoist-at hoist926 place926 )
    ( available hoist926 )
    ( hoist-at hoist845 place845 )
    ( available hoist845 )
    ( hoist-at hoist545 place545 )
    ( available hoist545 )
    ( hoist-at hoist571 place571 )
    ( available hoist571 )
    ( hoist-at hoist183 place183 )
    ( available hoist183 )
    ( hoist-at hoist121 place121 )
    ( available hoist121 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet397 place266 )
    ( surface-at crate397 place266 )
    ( on crate397 pallet397 )
    ( is-crate crate397 )
    ( clear crate397 )
    ( surface-at pallet304 place350 )
    ( surface-at crate304 place350 )
    ( on crate304 pallet304 )
    ( is-crate crate304 )
    ( clear crate304 )
    ( surface-at pallet567 place183 )
    ( surface-at crate567 place183 )
    ( on crate567 pallet567 )
    ( is-crate crate567 )
    ( clear crate567 )
    ( surface-at pallet244 place926 )
    ( surface-at crate244 place926 )
    ( on crate244 pallet244 )
    ( is-crate crate244 )
    ( clear crate244 )
    ( surface-at pallet376 place350 )
    ( surface-at crate376 place350 )
    ( on crate376 pallet376 )
    ( is-crate crate376 )
    ( clear crate376 )
    ( surface-at pallet438 place571 )
    ( surface-at crate438 place571 )
    ( on crate438 pallet438 )
    ( is-crate crate438 )
    ( clear crate438 )
    ( surface-at pallet908 place183 )
    ( surface-at crate908 place183 )
    ( on crate908 pallet908 )
    ( is-crate crate908 )
    ( clear crate908 )
    ( surface-at pallet770 place845 )
    ( surface-at crate770 place845 )
    ( on crate770 pallet770 )
    ( is-crate crate770 )
    ( clear crate770 )
  )
  ( :goal
    ( and
    )
  )
)
