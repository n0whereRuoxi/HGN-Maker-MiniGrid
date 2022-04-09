( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place925 - place
    hoist925 - hoist
    place32 - place
    hoist32 - hoist
    place617 - place
    hoist617 - hoist
    place201 - place
    hoist201 - hoist
    place156 - place
    hoist156 - hoist
    place663 - place
    hoist663 - hoist
    place18 - place
    hoist18 - hoist
    place853 - place
    hoist853 - hoist
    place787 - place
    hoist787 - hoist
    place142 - place
    hoist142 - hoist
    place411 - place
    hoist411 - hoist
    place753 - place
    hoist753 - hoist
    place578 - place
    hoist578 - hoist
    place375 - place
    hoist375 - hoist
    place488 - place
    hoist488 - hoist
    place0 - place
    hoist0 - hoist
    crate7 - surface
    pallet7 - surface
    crate517 - surface
    pallet517 - surface
    crate43 - surface
    pallet43 - surface
    crate876 - surface
    pallet876 - surface
    crate370 - surface
    pallet370 - surface
    crate762 - surface
    pallet762 - surface
    crate530 - surface
    pallet530 - surface
    crate556 - surface
    pallet556 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist925 place925 )
    ( available hoist925 )
    ( hoist-at hoist32 place32 )
    ( available hoist32 )
    ( hoist-at hoist617 place617 )
    ( available hoist617 )
    ( hoist-at hoist201 place201 )
    ( available hoist201 )
    ( hoist-at hoist156 place156 )
    ( available hoist156 )
    ( hoist-at hoist663 place663 )
    ( available hoist663 )
    ( hoist-at hoist18 place18 )
    ( available hoist18 )
    ( hoist-at hoist853 place853 )
    ( available hoist853 )
    ( hoist-at hoist787 place787 )
    ( available hoist787 )
    ( hoist-at hoist142 place142 )
    ( available hoist142 )
    ( hoist-at hoist411 place411 )
    ( available hoist411 )
    ( hoist-at hoist753 place753 )
    ( available hoist753 )
    ( hoist-at hoist578 place578 )
    ( available hoist578 )
    ( hoist-at hoist375 place375 )
    ( available hoist375 )
    ( hoist-at hoist488 place488 )
    ( available hoist488 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet7 place142 )
    ( surface-at crate7 place142 )
    ( on crate7 pallet7 )
    ( is-crate crate7 )
    ( clear crate7 )
    ( surface-at pallet517 place753 )
    ( surface-at crate517 place753 )
    ( on crate517 pallet517 )
    ( is-crate crate517 )
    ( clear crate517 )
    ( surface-at pallet43 place156 )
    ( surface-at crate43 place156 )
    ( on crate43 pallet43 )
    ( is-crate crate43 )
    ( clear crate43 )
    ( surface-at pallet876 place925 )
    ( surface-at crate876 place925 )
    ( on crate876 pallet876 )
    ( is-crate crate876 )
    ( clear crate876 )
    ( surface-at pallet370 place663 )
    ( surface-at crate370 place663 )
    ( on crate370 pallet370 )
    ( is-crate crate370 )
    ( clear crate370 )
    ( surface-at pallet762 place853 )
    ( surface-at crate762 place853 )
    ( on crate762 pallet762 )
    ( is-crate crate762 )
    ( clear crate762 )
    ( surface-at pallet530 place142 )
    ( surface-at crate530 place142 )
    ( on crate530 pallet530 )
    ( is-crate crate530 )
    ( clear crate530 )
    ( surface-at pallet556 place853 )
    ( surface-at crate556 place853 )
    ( on crate556 pallet556 )
    ( is-crate crate556 )
    ( clear crate556 )
  )
  ( :tasks
    ( Make-8Crate pallet0 crate7 crate517 crate43 crate876 crate370 crate762 crate530 crate556 )
  )
)
