( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place670 - place
    hoist670 - hoist
    place300 - place
    hoist300 - hoist
    place294 - place
    hoist294 - hoist
    place629 - place
    hoist629 - hoist
    place301 - place
    hoist301 - hoist
    place912 - place
    hoist912 - hoist
    place285 - place
    hoist285 - hoist
    place105 - place
    hoist105 - hoist
    place122 - place
    hoist122 - hoist
    place106 - place
    hoist106 - hoist
    place692 - place
    hoist692 - hoist
    place245 - place
    hoist245 - hoist
    place659 - place
    hoist659 - hoist
    place990 - place
    hoist990 - hoist
    place718 - place
    hoist718 - hoist
    place0 - place
    hoist0 - hoist
    crate196 - surface
    pallet196 - surface
    crate851 - surface
    pallet851 - surface
    crate777 - surface
    pallet777 - surface
    crate323 - surface
    pallet323 - surface
    crate560 - surface
    pallet560 - surface
    crate862 - surface
    pallet862 - surface
    crate582 - surface
    pallet582 - surface
    crate627 - surface
    pallet627 - surface
    crate796 - surface
    pallet796 - surface
    crate362 - surface
    pallet362 - surface
    crate732 - surface
    pallet732 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist670 place670 )
    ( available hoist670 )
    ( hoist-at hoist300 place300 )
    ( available hoist300 )
    ( hoist-at hoist294 place294 )
    ( available hoist294 )
    ( hoist-at hoist629 place629 )
    ( available hoist629 )
    ( hoist-at hoist301 place301 )
    ( available hoist301 )
    ( hoist-at hoist912 place912 )
    ( available hoist912 )
    ( hoist-at hoist285 place285 )
    ( available hoist285 )
    ( hoist-at hoist105 place105 )
    ( available hoist105 )
    ( hoist-at hoist122 place122 )
    ( available hoist122 )
    ( hoist-at hoist106 place106 )
    ( available hoist106 )
    ( hoist-at hoist692 place692 )
    ( available hoist692 )
    ( hoist-at hoist245 place245 )
    ( available hoist245 )
    ( hoist-at hoist659 place659 )
    ( available hoist659 )
    ( hoist-at hoist990 place990 )
    ( available hoist990 )
    ( hoist-at hoist718 place718 )
    ( available hoist718 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet196 place294 )
    ( surface-at crate196 place294 )
    ( on crate196 pallet196 )
    ( is-crate crate196 )
    ( clear crate196 )
    ( surface-at pallet851 place245 )
    ( surface-at crate851 place245 )
    ( on crate851 pallet851 )
    ( is-crate crate851 )
    ( clear crate851 )
    ( surface-at pallet777 place106 )
    ( surface-at crate777 place106 )
    ( on crate777 pallet777 )
    ( is-crate crate777 )
    ( clear crate777 )
    ( surface-at pallet323 place294 )
    ( surface-at crate323 place294 )
    ( on crate323 pallet323 )
    ( is-crate crate323 )
    ( clear crate323 )
    ( surface-at pallet560 place670 )
    ( surface-at crate560 place670 )
    ( on crate560 pallet560 )
    ( is-crate crate560 )
    ( clear crate560 )
    ( surface-at pallet862 place300 )
    ( surface-at crate862 place300 )
    ( on crate862 pallet862 )
    ( is-crate crate862 )
    ( clear crate862 )
    ( surface-at pallet582 place245 )
    ( surface-at crate582 place245 )
    ( on crate582 pallet582 )
    ( is-crate crate582 )
    ( clear crate582 )
    ( surface-at pallet627 place670 )
    ( surface-at crate627 place670 )
    ( on crate627 pallet627 )
    ( is-crate crate627 )
    ( clear crate627 )
    ( surface-at pallet796 place285 )
    ( surface-at crate796 place285 )
    ( on crate796 pallet796 )
    ( is-crate crate796 )
    ( clear crate796 )
    ( surface-at pallet362 place629 )
    ( surface-at crate362 place629 )
    ( on crate362 pallet362 )
    ( is-crate crate362 )
    ( clear crate362 )
    ( surface-at pallet732 place285 )
    ( surface-at crate732 place285 )
    ( on crate732 pallet732 )
    ( is-crate crate732 )
    ( clear crate732 )
  )
  ( :goal
    ( and
    )
  )
)
