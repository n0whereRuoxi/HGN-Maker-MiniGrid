( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place430 - place
    hoist430 - hoist
    place615 - place
    hoist615 - hoist
    place880 - place
    hoist880 - hoist
    place299 - place
    hoist299 - hoist
    place0 - place
    hoist0 - hoist
    crate632 - surface
    pallet632 - surface
    crate563 - surface
    pallet563 - surface
    crate534 - surface
    pallet534 - surface
    crate675 - surface
    pallet675 - surface
    crate430 - surface
    pallet430 - surface
    crate331 - surface
    pallet331 - surface
    crate317 - surface
    pallet317 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist430 place430 )
    ( available hoist430 )
    ( hoist-at hoist615 place615 )
    ( available hoist615 )
    ( hoist-at hoist880 place880 )
    ( available hoist880 )
    ( hoist-at hoist299 place299 )
    ( available hoist299 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet632 place430 )
    ( surface-at crate632 place430 )
    ( on crate632 pallet632 )
    ( is-crate crate632 )
    ( clear crate632 )
    ( surface-at pallet563 place880 )
    ( surface-at crate563 place880 )
    ( on crate563 pallet563 )
    ( is-crate crate563 )
    ( clear crate563 )
    ( surface-at pallet534 place880 )
    ( surface-at crate534 place880 )
    ( on crate534 pallet534 )
    ( is-crate crate534 )
    ( clear crate534 )
    ( surface-at pallet675 place299 )
    ( surface-at crate675 place299 )
    ( on crate675 pallet675 )
    ( is-crate crate675 )
    ( clear crate675 )
    ( surface-at pallet430 place299 )
    ( surface-at crate430 place299 )
    ( on crate430 pallet430 )
    ( is-crate crate430 )
    ( clear crate430 )
    ( surface-at pallet331 place430 )
    ( surface-at crate331 place430 )
    ( on crate331 pallet331 )
    ( is-crate crate331 )
    ( clear crate331 )
    ( surface-at pallet317 place880 )
    ( surface-at crate317 place880 )
    ( on crate317 pallet317 )
    ( is-crate crate317 )
    ( clear crate317 )
  )
  ( :goal
    ( and
    )
  )
)
