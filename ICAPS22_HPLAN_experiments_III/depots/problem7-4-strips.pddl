( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place110 - place
    hoist110 - hoist
    place163 - place
    hoist163 - hoist
    place837 - place
    hoist837 - hoist
    place16 - place
    hoist16 - hoist
    place348 - place
    hoist348 - hoist
    place361 - place
    hoist361 - hoist
    place71 - place
    hoist71 - hoist
    place773 - place
    hoist773 - hoist
    place85 - place
    hoist85 - hoist
    place0 - place
    hoist0 - hoist
    crate242 - surface
    pallet242 - surface
    crate351 - surface
    pallet351 - surface
    crate160 - surface
    pallet160 - surface
    crate419 - surface
    pallet419 - surface
    crate652 - surface
    pallet652 - surface
    crate392 - surface
    pallet392 - surface
    crate883 - surface
    pallet883 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist110 place110 )
    ( available hoist110 )
    ( hoist-at hoist163 place163 )
    ( available hoist163 )
    ( hoist-at hoist837 place837 )
    ( available hoist837 )
    ( hoist-at hoist16 place16 )
    ( available hoist16 )
    ( hoist-at hoist348 place348 )
    ( available hoist348 )
    ( hoist-at hoist361 place361 )
    ( available hoist361 )
    ( hoist-at hoist71 place71 )
    ( available hoist71 )
    ( hoist-at hoist773 place773 )
    ( available hoist773 )
    ( hoist-at hoist85 place85 )
    ( available hoist85 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet242 place110 )
    ( surface-at crate242 place110 )
    ( on crate242 pallet242 )
    ( is-crate crate242 )
    ( clear crate242 )
    ( surface-at pallet351 place837 )
    ( surface-at crate351 place837 )
    ( on crate351 pallet351 )
    ( is-crate crate351 )
    ( clear crate351 )
    ( surface-at pallet160 place773 )
    ( surface-at crate160 place773 )
    ( on crate160 pallet160 )
    ( is-crate crate160 )
    ( clear crate160 )
    ( surface-at pallet419 place71 )
    ( surface-at crate419 place71 )
    ( on crate419 pallet419 )
    ( is-crate crate419 )
    ( clear crate419 )
    ( surface-at pallet652 place163 )
    ( surface-at crate652 place163 )
    ( on crate652 pallet652 )
    ( is-crate crate652 )
    ( clear crate652 )
    ( surface-at pallet392 place16 )
    ( surface-at crate392 place16 )
    ( on crate392 pallet392 )
    ( is-crate crate392 )
    ( clear crate392 )
    ( surface-at pallet883 place348 )
    ( surface-at crate883 place348 )
    ( on crate883 pallet883 )
    ( is-crate crate883 )
    ( clear crate883 )
  )
  ( :goal
    ( and
    )
  )
)
