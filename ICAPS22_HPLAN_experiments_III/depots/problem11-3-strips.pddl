( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place418 - place
    hoist418 - hoist
    place317 - place
    hoist317 - hoist
    place993 - place
    hoist993 - hoist
    place117 - place
    hoist117 - hoist
    place120 - place
    hoist120 - hoist
    place798 - place
    hoist798 - hoist
    place168 - place
    hoist168 - hoist
    place279 - place
    hoist279 - hoist
    place676 - place
    hoist676 - hoist
    place35 - place
    hoist35 - hoist
    place69 - place
    hoist69 - hoist
    place0 - place
    hoist0 - hoist
    crate527 - surface
    pallet527 - surface
    crate446 - surface
    pallet446 - surface
    crate565 - surface
    pallet565 - surface
    crate692 - surface
    pallet692 - surface
    crate452 - surface
    pallet452 - surface
    crate482 - surface
    pallet482 - surface
    crate358 - surface
    pallet358 - surface
    crate104 - surface
    pallet104 - surface
    crate216 - surface
    pallet216 - surface
    crate282 - surface
    pallet282 - surface
    crate215 - surface
    pallet215 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist418 place418 )
    ( available hoist418 )
    ( hoist-at hoist317 place317 )
    ( available hoist317 )
    ( hoist-at hoist993 place993 )
    ( available hoist993 )
    ( hoist-at hoist117 place117 )
    ( available hoist117 )
    ( hoist-at hoist120 place120 )
    ( available hoist120 )
    ( hoist-at hoist798 place798 )
    ( available hoist798 )
    ( hoist-at hoist168 place168 )
    ( available hoist168 )
    ( hoist-at hoist279 place279 )
    ( available hoist279 )
    ( hoist-at hoist676 place676 )
    ( available hoist676 )
    ( hoist-at hoist35 place35 )
    ( available hoist35 )
    ( hoist-at hoist69 place69 )
    ( available hoist69 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet527 place69 )
    ( surface-at crate527 place69 )
    ( on crate527 pallet527 )
    ( is-crate crate527 )
    ( clear crate527 )
    ( surface-at pallet446 place676 )
    ( surface-at crate446 place676 )
    ( on crate446 pallet446 )
    ( is-crate crate446 )
    ( clear crate446 )
    ( surface-at pallet565 place120 )
    ( surface-at crate565 place120 )
    ( on crate565 pallet565 )
    ( is-crate crate565 )
    ( clear crate565 )
    ( surface-at pallet692 place117 )
    ( surface-at crate692 place117 )
    ( on crate692 pallet692 )
    ( is-crate crate692 )
    ( clear crate692 )
    ( surface-at pallet452 place798 )
    ( surface-at crate452 place798 )
    ( on crate452 pallet452 )
    ( is-crate crate452 )
    ( clear crate452 )
    ( surface-at pallet482 place279 )
    ( surface-at crate482 place279 )
    ( on crate482 pallet482 )
    ( is-crate crate482 )
    ( clear crate482 )
    ( surface-at pallet358 place317 )
    ( surface-at crate358 place317 )
    ( on crate358 pallet358 )
    ( is-crate crate358 )
    ( clear crate358 )
    ( surface-at pallet104 place279 )
    ( surface-at crate104 place279 )
    ( on crate104 pallet104 )
    ( is-crate crate104 )
    ( clear crate104 )
    ( surface-at pallet216 place993 )
    ( surface-at crate216 place993 )
    ( on crate216 pallet216 )
    ( is-crate crate216 )
    ( clear crate216 )
    ( surface-at pallet282 place676 )
    ( surface-at crate282 place676 )
    ( on crate282 pallet282 )
    ( is-crate crate282 )
    ( clear crate282 )
    ( surface-at pallet215 place317 )
    ( surface-at crate215 place317 )
    ( on crate215 pallet215 )
    ( is-crate crate215 )
    ( clear crate215 )
  )
  ( :goal
    ( and
    )
  )
)
