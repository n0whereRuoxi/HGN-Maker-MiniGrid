( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place148 - place
    hoist148 - hoist
    place125 - place
    hoist125 - hoist
    place586 - place
    hoist586 - hoist
    place222 - place
    hoist222 - hoist
    place945 - place
    hoist945 - hoist
    place356 - place
    hoist356 - hoist
    place0 - place
    hoist0 - hoist
    crate754 - surface
    pallet754 - surface
    crate261 - surface
    pallet261 - surface
    crate731 - surface
    pallet731 - surface
    crate310 - surface
    pallet310 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist148 place148 )
    ( available hoist148 )
    ( hoist-at hoist125 place125 )
    ( available hoist125 )
    ( hoist-at hoist586 place586 )
    ( available hoist586 )
    ( hoist-at hoist222 place222 )
    ( available hoist222 )
    ( hoist-at hoist945 place945 )
    ( available hoist945 )
    ( hoist-at hoist356 place356 )
    ( available hoist356 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet754 place125 )
    ( surface-at crate754 place125 )
    ( on crate754 pallet754 )
    ( is-crate crate754 )
    ( clear crate754 )
    ( surface-at pallet261 place148 )
    ( surface-at crate261 place148 )
    ( on crate261 pallet261 )
    ( is-crate crate261 )
    ( clear crate261 )
    ( surface-at pallet731 place222 )
    ( surface-at crate731 place222 )
    ( on crate731 pallet731 )
    ( is-crate crate731 )
    ( clear crate731 )
    ( surface-at pallet310 place222 )
    ( surface-at crate310 place222 )
    ( on crate310 pallet310 )
    ( is-crate crate310 )
    ( clear crate310 )
  )
  ( :tasks
    ( Make-4Crate pallet0 crate754 crate261 crate731 crate310 )
  )
)
