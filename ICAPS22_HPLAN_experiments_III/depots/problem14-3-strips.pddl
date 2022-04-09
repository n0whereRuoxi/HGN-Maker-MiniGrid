( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place657 - place
    hoist657 - hoist
    place869 - place
    hoist869 - hoist
    place784 - place
    hoist784 - hoist
    place972 - place
    hoist972 - hoist
    place73 - place
    hoist73 - hoist
    place86 - place
    hoist86 - hoist
    place125 - place
    hoist125 - hoist
    place575 - place
    hoist575 - hoist
    place942 - place
    hoist942 - hoist
    place981 - place
    hoist981 - hoist
    place491 - place
    hoist491 - hoist
    place359 - place
    hoist359 - hoist
    place455 - place
    hoist455 - hoist
    place939 - place
    hoist939 - hoist
    place219 - place
    hoist219 - hoist
    place151 - place
    hoist151 - hoist
    place203 - place
    hoist203 - hoist
    place45 - place
    hoist45 - hoist
    place321 - place
    hoist321 - hoist
    place162 - place
    hoist162 - hoist
    place11 - place
    hoist11 - hoist
    place161 - place
    hoist161 - hoist
    place122 - place
    hoist122 - hoist
    place610 - place
    hoist610 - hoist
    place465 - place
    hoist465 - hoist
    place316 - place
    hoist316 - hoist
    place762 - place
    hoist762 - hoist
    place0 - place
    hoist0 - hoist
    crate410 - surface
    pallet410 - surface
    crate744 - surface
    pallet744 - surface
    crate805 - surface
    pallet805 - surface
    crate903 - surface
    pallet903 - surface
    crate648 - surface
    pallet648 - surface
    crate26 - surface
    pallet26 - surface
    crate893 - surface
    pallet893 - surface
    crate74 - surface
    pallet74 - surface
    crate93 - surface
    pallet93 - surface
    crate145 - surface
    pallet145 - surface
    crate404 - surface
    pallet404 - surface
    crate465 - surface
    pallet465 - surface
    crate588 - surface
    pallet588 - surface
    crate816 - surface
    pallet816 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist657 place657 )
    ( available hoist657 )
    ( hoist-at hoist869 place869 )
    ( available hoist869 )
    ( hoist-at hoist784 place784 )
    ( available hoist784 )
    ( hoist-at hoist972 place972 )
    ( available hoist972 )
    ( hoist-at hoist73 place73 )
    ( available hoist73 )
    ( hoist-at hoist86 place86 )
    ( available hoist86 )
    ( hoist-at hoist125 place125 )
    ( available hoist125 )
    ( hoist-at hoist575 place575 )
    ( available hoist575 )
    ( hoist-at hoist942 place942 )
    ( available hoist942 )
    ( hoist-at hoist981 place981 )
    ( available hoist981 )
    ( hoist-at hoist491 place491 )
    ( available hoist491 )
    ( hoist-at hoist359 place359 )
    ( available hoist359 )
    ( hoist-at hoist455 place455 )
    ( available hoist455 )
    ( hoist-at hoist939 place939 )
    ( available hoist939 )
    ( hoist-at hoist219 place219 )
    ( available hoist219 )
    ( hoist-at hoist151 place151 )
    ( available hoist151 )
    ( hoist-at hoist203 place203 )
    ( available hoist203 )
    ( hoist-at hoist45 place45 )
    ( available hoist45 )
    ( hoist-at hoist321 place321 )
    ( available hoist321 )
    ( hoist-at hoist162 place162 )
    ( available hoist162 )
    ( hoist-at hoist11 place11 )
    ( available hoist11 )
    ( hoist-at hoist161 place161 )
    ( available hoist161 )
    ( hoist-at hoist122 place122 )
    ( available hoist122 )
    ( hoist-at hoist610 place610 )
    ( available hoist610 )
    ( hoist-at hoist465 place465 )
    ( available hoist465 )
    ( hoist-at hoist316 place316 )
    ( available hoist316 )
    ( hoist-at hoist762 place762 )
    ( available hoist762 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet410 place657 )
    ( surface-at crate410 place657 )
    ( on crate410 pallet410 )
    ( is-crate crate410 )
    ( clear crate410 )
    ( surface-at pallet744 place122 )
    ( surface-at crate744 place122 )
    ( on crate744 pallet744 )
    ( is-crate crate744 )
    ( clear crate744 )
    ( surface-at pallet805 place45 )
    ( surface-at crate805 place45 )
    ( on crate805 pallet805 )
    ( is-crate crate805 )
    ( clear crate805 )
    ( surface-at pallet903 place657 )
    ( surface-at crate903 place657 )
    ( on crate903 pallet903 )
    ( is-crate crate903 )
    ( clear crate903 )
    ( surface-at pallet648 place762 )
    ( surface-at crate648 place762 )
    ( on crate648 pallet648 )
    ( is-crate crate648 )
    ( clear crate648 )
    ( surface-at pallet26 place73 )
    ( surface-at crate26 place73 )
    ( on crate26 pallet26 )
    ( is-crate crate26 )
    ( clear crate26 )
    ( surface-at pallet893 place219 )
    ( surface-at crate893 place219 )
    ( on crate893 pallet893 )
    ( is-crate crate893 )
    ( clear crate893 )
    ( surface-at pallet74 place610 )
    ( surface-at crate74 place610 )
    ( on crate74 pallet74 )
    ( is-crate crate74 )
    ( clear crate74 )
    ( surface-at pallet93 place45 )
    ( surface-at crate93 place45 )
    ( on crate93 pallet93 )
    ( is-crate crate93 )
    ( clear crate93 )
    ( surface-at pallet145 place762 )
    ( surface-at crate145 place762 )
    ( on crate145 pallet145 )
    ( is-crate crate145 )
    ( clear crate145 )
    ( surface-at pallet404 place455 )
    ( surface-at crate404 place455 )
    ( on crate404 pallet404 )
    ( is-crate crate404 )
    ( clear crate404 )
    ( surface-at pallet465 place359 )
    ( surface-at crate465 place359 )
    ( on crate465 pallet465 )
    ( is-crate crate465 )
    ( clear crate465 )
    ( surface-at pallet588 place73 )
    ( surface-at crate588 place73 )
    ( on crate588 pallet588 )
    ( is-crate crate588 )
    ( clear crate588 )
    ( surface-at pallet816 place316 )
    ( surface-at crate816 place316 )
    ( on crate816 pallet816 )
    ( is-crate crate816 )
    ( clear crate816 )
  )
  ( :goal
    ( and
    )
  )
)
