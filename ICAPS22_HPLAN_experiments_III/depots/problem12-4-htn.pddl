( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place593 - place
    hoist593 - hoist
    place231 - place
    hoist231 - hoist
    place251 - place
    hoist251 - hoist
    place48 - place
    hoist48 - hoist
    place891 - place
    hoist891 - hoist
    place164 - place
    hoist164 - hoist
    place0 - place
    hoist0 - hoist
    crate892 - surface
    pallet892 - surface
    crate953 - surface
    pallet953 - surface
    crate515 - surface
    pallet515 - surface
    crate177 - surface
    pallet177 - surface
    crate8 - surface
    pallet8 - surface
    crate627 - surface
    pallet627 - surface
    crate614 - surface
    pallet614 - surface
    crate939 - surface
    pallet939 - surface
    crate120 - surface
    pallet120 - surface
    crate67 - surface
    pallet67 - surface
    crate478 - surface
    pallet478 - surface
    crate226 - surface
    pallet226 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist593 place593 )
    ( available hoist593 )
    ( hoist-at hoist231 place231 )
    ( available hoist231 )
    ( hoist-at hoist251 place251 )
    ( available hoist251 )
    ( hoist-at hoist48 place48 )
    ( available hoist48 )
    ( hoist-at hoist891 place891 )
    ( available hoist891 )
    ( hoist-at hoist164 place164 )
    ( available hoist164 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet892 place231 )
    ( surface-at crate892 place231 )
    ( on crate892 pallet892 )
    ( is-crate crate892 )
    ( clear crate892 )
    ( surface-at pallet953 place593 )
    ( surface-at crate953 place593 )
    ( on crate953 pallet953 )
    ( is-crate crate953 )
    ( clear crate953 )
    ( surface-at pallet515 place231 )
    ( surface-at crate515 place231 )
    ( on crate515 pallet515 )
    ( is-crate crate515 )
    ( clear crate515 )
    ( surface-at pallet177 place251 )
    ( surface-at crate177 place251 )
    ( on crate177 pallet177 )
    ( is-crate crate177 )
    ( clear crate177 )
    ( surface-at pallet8 place48 )
    ( surface-at crate8 place48 )
    ( on crate8 pallet8 )
    ( is-crate crate8 )
    ( clear crate8 )
    ( surface-at pallet627 place593 )
    ( surface-at crate627 place593 )
    ( on crate627 pallet627 )
    ( is-crate crate627 )
    ( clear crate627 )
    ( surface-at pallet614 place231 )
    ( surface-at crate614 place231 )
    ( on crate614 pallet614 )
    ( is-crate crate614 )
    ( clear crate614 )
    ( surface-at pallet939 place48 )
    ( surface-at crate939 place48 )
    ( on crate939 pallet939 )
    ( is-crate crate939 )
    ( clear crate939 )
    ( surface-at pallet120 place231 )
    ( surface-at crate120 place231 )
    ( on crate120 pallet120 )
    ( is-crate crate120 )
    ( clear crate120 )
    ( surface-at pallet67 place164 )
    ( surface-at crate67 place164 )
    ( on crate67 pallet67 )
    ( is-crate crate67 )
    ( clear crate67 )
    ( surface-at pallet478 place48 )
    ( surface-at crate478 place48 )
    ( on crate478 pallet478 )
    ( is-crate crate478 )
    ( clear crate478 )
    ( surface-at pallet226 place593 )
    ( surface-at crate226 place593 )
    ( on crate226 pallet226 )
    ( is-crate crate226 )
    ( clear crate226 )
  )
  ( :tasks
    ( Make-12Crate crate892 crate953 crate515 crate177 crate8 crate627 crate614 crate939 crate120 crate67 crate478 crate226 l000 )
  )
)
