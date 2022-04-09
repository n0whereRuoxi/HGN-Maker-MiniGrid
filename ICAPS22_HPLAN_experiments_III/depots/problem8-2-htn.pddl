( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place985 - place
    hoist985 - hoist
    place263 - place
    hoist263 - hoist
    place987 - place
    hoist987 - hoist
    place100 - place
    hoist100 - hoist
    place573 - place
    hoist573 - hoist
    place963 - place
    hoist963 - hoist
    place0 - place
    hoist0 - hoist
    crate280 - surface
    pallet280 - surface
    crate395 - surface
    pallet395 - surface
    crate121 - surface
    pallet121 - surface
    crate79 - surface
    pallet79 - surface
    crate591 - surface
    pallet591 - surface
    crate407 - surface
    pallet407 - surface
    crate37 - surface
    pallet37 - surface
    crate468 - surface
    pallet468 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist985 place985 )
    ( available hoist985 )
    ( hoist-at hoist263 place263 )
    ( available hoist263 )
    ( hoist-at hoist987 place987 )
    ( available hoist987 )
    ( hoist-at hoist100 place100 )
    ( available hoist100 )
    ( hoist-at hoist573 place573 )
    ( available hoist573 )
    ( hoist-at hoist963 place963 )
    ( available hoist963 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet280 place963 )
    ( surface-at crate280 place963 )
    ( on crate280 pallet280 )
    ( is-crate crate280 )
    ( clear crate280 )
    ( surface-at pallet395 place100 )
    ( surface-at crate395 place100 )
    ( on crate395 pallet395 )
    ( is-crate crate395 )
    ( clear crate395 )
    ( surface-at pallet121 place985 )
    ( surface-at crate121 place985 )
    ( on crate121 pallet121 )
    ( is-crate crate121 )
    ( clear crate121 )
    ( surface-at pallet79 place985 )
    ( surface-at crate79 place985 )
    ( on crate79 pallet79 )
    ( is-crate crate79 )
    ( clear crate79 )
    ( surface-at pallet591 place100 )
    ( surface-at crate591 place100 )
    ( on crate591 pallet591 )
    ( is-crate crate591 )
    ( clear crate591 )
    ( surface-at pallet407 place263 )
    ( surface-at crate407 place263 )
    ( on crate407 pallet407 )
    ( is-crate crate407 )
    ( clear crate407 )
    ( surface-at pallet37 place100 )
    ( surface-at crate37 place100 )
    ( on crate37 pallet37 )
    ( is-crate crate37 )
    ( clear crate37 )
    ( surface-at pallet468 place987 )
    ( surface-at crate468 place987 )
    ( on crate468 pallet468 )
    ( is-crate crate468 )
    ( clear crate468 )
  )
  ( :tasks
    ( Make-8Crate crate280 crate395 crate121 crate79 crate591 crate407 crate37 crate468 l000 )
  )
)
