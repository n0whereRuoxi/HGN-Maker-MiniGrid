( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place514 - place
    hoist514 - hoist
    place815 - place
    hoist815 - hoist
    place500 - place
    hoist500 - hoist
    place133 - place
    hoist133 - hoist
    place971 - place
    hoist971 - hoist
    place0 - place
    hoist0 - hoist
    crate607 - surface
    pallet607 - surface
    crate804 - surface
    pallet804 - surface
    crate431 - surface
    pallet431 - surface
    crate277 - surface
    pallet277 - surface
    crate991 - surface
    pallet991 - surface
    crate476 - surface
    pallet476 - surface
    crate388 - surface
    pallet388 - surface
    crate504 - surface
    pallet504 - surface
    crate130 - surface
    pallet130 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist514 place514 )
    ( available hoist514 )
    ( hoist-at hoist815 place815 )
    ( available hoist815 )
    ( hoist-at hoist500 place500 )
    ( available hoist500 )
    ( hoist-at hoist133 place133 )
    ( available hoist133 )
    ( hoist-at hoist971 place971 )
    ( available hoist971 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet607 place133 )
    ( surface-at crate607 place133 )
    ( on crate607 pallet607 )
    ( is-crate crate607 )
    ( clear crate607 )
    ( surface-at pallet804 place514 )
    ( surface-at crate804 place514 )
    ( on crate804 pallet804 )
    ( is-crate crate804 )
    ( clear crate804 )
    ( surface-at pallet431 place133 )
    ( surface-at crate431 place133 )
    ( on crate431 pallet431 )
    ( is-crate crate431 )
    ( clear crate431 )
    ( surface-at pallet277 place133 )
    ( surface-at crate277 place133 )
    ( on crate277 pallet277 )
    ( is-crate crate277 )
    ( clear crate277 )
    ( surface-at pallet991 place514 )
    ( surface-at crate991 place514 )
    ( on crate991 pallet991 )
    ( is-crate crate991 )
    ( clear crate991 )
    ( surface-at pallet476 place133 )
    ( surface-at crate476 place133 )
    ( on crate476 pallet476 )
    ( is-crate crate476 )
    ( clear crate476 )
    ( surface-at pallet388 place514 )
    ( surface-at crate388 place514 )
    ( on crate388 pallet388 )
    ( is-crate crate388 )
    ( clear crate388 )
    ( surface-at pallet504 place500 )
    ( surface-at crate504 place500 )
    ( on crate504 pallet504 )
    ( is-crate crate504 )
    ( clear crate504 )
    ( surface-at pallet130 place815 )
    ( surface-at crate130 place815 )
    ( on crate130 pallet130 )
    ( is-crate crate130 )
    ( clear crate130 )
  )
  ( :goal
    ( and
    )
  )
)
