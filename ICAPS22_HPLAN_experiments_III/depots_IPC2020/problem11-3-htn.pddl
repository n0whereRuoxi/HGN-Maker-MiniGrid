( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place429 - place
    hoist429 - hoist
    place372 - place
    hoist372 - hoist
    place949 - place
    hoist949 - hoist
    place413 - place
    hoist413 - hoist
    place330 - place
    hoist330 - hoist
    place998 - place
    hoist998 - hoist
    place799 - place
    hoist799 - hoist
    place0 - place
    hoist0 - hoist
    crate158 - surface
    pallet158 - surface
    crate35 - surface
    pallet35 - surface
    crate921 - surface
    pallet921 - surface
    crate865 - surface
    pallet865 - surface
    crate371 - surface
    pallet371 - surface
    crate320 - surface
    pallet320 - surface
    crate104 - surface
    pallet104 - surface
    crate790 - surface
    pallet790 - surface
    crate70 - surface
    pallet70 - surface
    crate926 - surface
    pallet926 - surface
    crate914 - surface
    pallet914 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist429 place429 )
    ( available hoist429 )
    ( hoist-at hoist372 place372 )
    ( available hoist372 )
    ( hoist-at hoist949 place949 )
    ( available hoist949 )
    ( hoist-at hoist413 place413 )
    ( available hoist413 )
    ( hoist-at hoist330 place330 )
    ( available hoist330 )
    ( hoist-at hoist998 place998 )
    ( available hoist998 )
    ( hoist-at hoist799 place799 )
    ( available hoist799 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet158 place330 )
    ( surface-at crate158 place330 )
    ( on crate158 pallet158 )
    ( is-crate crate158 )
    ( clear crate158 )
    ( surface-at pallet35 place413 )
    ( surface-at crate35 place413 )
    ( on crate35 pallet35 )
    ( is-crate crate35 )
    ( clear crate35 )
    ( surface-at pallet921 place429 )
    ( surface-at crate921 place429 )
    ( on crate921 pallet921 )
    ( is-crate crate921 )
    ( clear crate921 )
    ( surface-at pallet865 place330 )
    ( surface-at crate865 place330 )
    ( on crate865 pallet865 )
    ( is-crate crate865 )
    ( clear crate865 )
    ( surface-at pallet371 place372 )
    ( surface-at crate371 place372 )
    ( on crate371 pallet371 )
    ( is-crate crate371 )
    ( clear crate371 )
    ( surface-at pallet320 place799 )
    ( surface-at crate320 place799 )
    ( on crate320 pallet320 )
    ( is-crate crate320 )
    ( clear crate320 )
    ( surface-at pallet104 place998 )
    ( surface-at crate104 place998 )
    ( on crate104 pallet104 )
    ( is-crate crate104 )
    ( clear crate104 )
    ( surface-at pallet790 place799 )
    ( surface-at crate790 place799 )
    ( on crate790 pallet790 )
    ( is-crate crate790 )
    ( clear crate790 )
    ( surface-at pallet70 place372 )
    ( surface-at crate70 place372 )
    ( on crate70 pallet70 )
    ( is-crate crate70 )
    ( clear crate70 )
    ( surface-at pallet926 place413 )
    ( surface-at crate926 place413 )
    ( on crate926 pallet926 )
    ( is-crate crate926 )
    ( clear crate926 )
    ( surface-at pallet914 place330 )
    ( surface-at crate914 place330 )
    ( on crate914 pallet914 )
    ( is-crate crate914 )
    ( clear crate914 )
  )
  ( :tasks
    ( Make-11Crate pallet0 crate158 crate35 crate921 crate865 crate371 crate320 crate104 crate790 crate70 crate926 crate914 )
  )
)
