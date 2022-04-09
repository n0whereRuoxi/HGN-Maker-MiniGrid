( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place190 - place
    hoist190 - hoist
    place465 - place
    hoist465 - hoist
    place553 - place
    hoist553 - hoist
    place997 - place
    hoist997 - hoist
    place845 - place
    hoist845 - hoist
    place777 - place
    hoist777 - hoist
    place423 - place
    hoist423 - hoist
    place543 - place
    hoist543 - hoist
    place265 - place
    hoist265 - hoist
    place0 - place
    hoist0 - hoist
    crate698 - surface
    pallet698 - surface
    crate183 - surface
    pallet183 - surface
    crate300 - surface
    pallet300 - surface
    crate151 - surface
    pallet151 - surface
    crate816 - surface
    pallet816 - surface
    crate871 - surface
    pallet871 - surface
    crate483 - surface
    pallet483 - surface
    crate324 - surface
    pallet324 - surface
    crate115 - surface
    pallet115 - surface
    crate929 - surface
    pallet929 - surface
    crate850 - surface
    pallet850 - surface
    crate748 - surface
    pallet748 - surface
    crate470 - surface
    pallet470 - surface
    crate624 - surface
    pallet624 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist190 place190 )
    ( available hoist190 )
    ( hoist-at hoist465 place465 )
    ( available hoist465 )
    ( hoist-at hoist553 place553 )
    ( available hoist553 )
    ( hoist-at hoist997 place997 )
    ( available hoist997 )
    ( hoist-at hoist845 place845 )
    ( available hoist845 )
    ( hoist-at hoist777 place777 )
    ( available hoist777 )
    ( hoist-at hoist423 place423 )
    ( available hoist423 )
    ( hoist-at hoist543 place543 )
    ( available hoist543 )
    ( hoist-at hoist265 place265 )
    ( available hoist265 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet698 place190 )
    ( surface-at crate698 place190 )
    ( on crate698 pallet698 )
    ( is-crate crate698 )
    ( clear crate698 )
    ( surface-at pallet183 place265 )
    ( surface-at crate183 place265 )
    ( on crate183 pallet183 )
    ( is-crate crate183 )
    ( clear crate183 )
    ( surface-at pallet300 place845 )
    ( surface-at crate300 place845 )
    ( on crate300 pallet300 )
    ( is-crate crate300 )
    ( clear crate300 )
    ( surface-at pallet151 place845 )
    ( surface-at crate151 place845 )
    ( on crate151 pallet151 )
    ( is-crate crate151 )
    ( clear crate151 )
    ( surface-at pallet816 place845 )
    ( surface-at crate816 place845 )
    ( on crate816 pallet816 )
    ( is-crate crate816 )
    ( clear crate816 )
    ( surface-at pallet871 place265 )
    ( surface-at crate871 place265 )
    ( on crate871 pallet871 )
    ( is-crate crate871 )
    ( clear crate871 )
    ( surface-at pallet483 place265 )
    ( surface-at crate483 place265 )
    ( on crate483 pallet483 )
    ( is-crate crate483 )
    ( clear crate483 )
    ( surface-at pallet324 place543 )
    ( surface-at crate324 place543 )
    ( on crate324 pallet324 )
    ( is-crate crate324 )
    ( clear crate324 )
    ( surface-at pallet115 place423 )
    ( surface-at crate115 place423 )
    ( on crate115 pallet115 )
    ( is-crate crate115 )
    ( clear crate115 )
    ( surface-at pallet929 place465 )
    ( surface-at crate929 place465 )
    ( on crate929 pallet929 )
    ( is-crate crate929 )
    ( clear crate929 )
    ( surface-at pallet850 place423 )
    ( surface-at crate850 place423 )
    ( on crate850 pallet850 )
    ( is-crate crate850 )
    ( clear crate850 )
    ( surface-at pallet748 place777 )
    ( surface-at crate748 place777 )
    ( on crate748 pallet748 )
    ( is-crate crate748 )
    ( clear crate748 )
    ( surface-at pallet470 place997 )
    ( surface-at crate470 place997 )
    ( on crate470 pallet470 )
    ( is-crate crate470 )
    ( clear crate470 )
    ( surface-at pallet624 place777 )
    ( surface-at crate624 place777 )
    ( on crate624 pallet624 )
    ( is-crate crate624 )
    ( clear crate624 )
  )
  ( :tasks
    ( Make-14Crate crate698 crate183 crate300 crate151 crate816 crate871 crate483 crate324 crate115 crate929 crate850 crate748 crate470 crate624 l000 )
  )
)
