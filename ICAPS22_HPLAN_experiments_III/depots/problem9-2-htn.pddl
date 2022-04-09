( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place374 - place
    hoist374 - hoist
    place879 - place
    hoist879 - hoist
    place61 - place
    hoist61 - hoist
    place375 - place
    hoist375 - hoist
    place95 - place
    hoist95 - hoist
    place499 - place
    hoist499 - hoist
    place525 - place
    hoist525 - hoist
    place641 - place
    hoist641 - hoist
    place24 - place
    hoist24 - hoist
    place912 - place
    hoist912 - hoist
    place806 - place
    hoist806 - hoist
    place590 - place
    hoist590 - hoist
    place14 - place
    hoist14 - hoist
    place811 - place
    hoist811 - hoist
    place191 - place
    hoist191 - hoist
    place0 - place
    hoist0 - hoist
    crate626 - surface
    pallet626 - surface
    crate744 - surface
    pallet744 - surface
    crate828 - surface
    pallet828 - surface
    crate75 - surface
    pallet75 - surface
    crate701 - surface
    pallet701 - surface
    crate836 - surface
    pallet836 - surface
    crate154 - surface
    pallet154 - surface
    crate374 - surface
    pallet374 - surface
    crate751 - surface
    pallet751 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist374 place374 )
    ( available hoist374 )
    ( hoist-at hoist879 place879 )
    ( available hoist879 )
    ( hoist-at hoist61 place61 )
    ( available hoist61 )
    ( hoist-at hoist375 place375 )
    ( available hoist375 )
    ( hoist-at hoist95 place95 )
    ( available hoist95 )
    ( hoist-at hoist499 place499 )
    ( available hoist499 )
    ( hoist-at hoist525 place525 )
    ( available hoist525 )
    ( hoist-at hoist641 place641 )
    ( available hoist641 )
    ( hoist-at hoist24 place24 )
    ( available hoist24 )
    ( hoist-at hoist912 place912 )
    ( available hoist912 )
    ( hoist-at hoist806 place806 )
    ( available hoist806 )
    ( hoist-at hoist590 place590 )
    ( available hoist590 )
    ( hoist-at hoist14 place14 )
    ( available hoist14 )
    ( hoist-at hoist811 place811 )
    ( available hoist811 )
    ( hoist-at hoist191 place191 )
    ( available hoist191 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet626 place95 )
    ( surface-at crate626 place95 )
    ( on crate626 pallet626 )
    ( is-crate crate626 )
    ( clear crate626 )
    ( surface-at pallet744 place24 )
    ( surface-at crate744 place24 )
    ( on crate744 pallet744 )
    ( is-crate crate744 )
    ( clear crate744 )
    ( surface-at pallet828 place879 )
    ( surface-at crate828 place879 )
    ( on crate828 pallet828 )
    ( is-crate crate828 )
    ( clear crate828 )
    ( surface-at pallet75 place375 )
    ( surface-at crate75 place375 )
    ( on crate75 pallet75 )
    ( is-crate crate75 )
    ( clear crate75 )
    ( surface-at pallet701 place375 )
    ( surface-at crate701 place375 )
    ( on crate701 pallet701 )
    ( is-crate crate701 )
    ( clear crate701 )
    ( surface-at pallet836 place95 )
    ( surface-at crate836 place95 )
    ( on crate836 pallet836 )
    ( is-crate crate836 )
    ( clear crate836 )
    ( surface-at pallet154 place61 )
    ( surface-at crate154 place61 )
    ( on crate154 pallet154 )
    ( is-crate crate154 )
    ( clear crate154 )
    ( surface-at pallet374 place525 )
    ( surface-at crate374 place525 )
    ( on crate374 pallet374 )
    ( is-crate crate374 )
    ( clear crate374 )
    ( surface-at pallet751 place95 )
    ( surface-at crate751 place95 )
    ( on crate751 pallet751 )
    ( is-crate crate751 )
    ( clear crate751 )
  )
  ( :tasks
    ( Make-9Crate crate626 crate744 crate828 crate75 crate701 crate836 crate154 crate374 crate751 l000 )
  )
)
