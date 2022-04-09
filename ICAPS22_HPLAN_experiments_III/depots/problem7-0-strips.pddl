( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place776 - place
    hoist776 - hoist
    place72 - place
    hoist72 - hoist
    place193 - place
    hoist193 - hoist
    place252 - place
    hoist252 - hoist
    place513 - place
    hoist513 - hoist
    place593 - place
    hoist593 - hoist
    place631 - place
    hoist631 - hoist
    place644 - place
    hoist644 - hoist
    place34 - place
    hoist34 - hoist
    place578 - place
    hoist578 - hoist
    place745 - place
    hoist745 - hoist
    place428 - place
    hoist428 - hoist
    place0 - place
    hoist0 - hoist
    crate963 - surface
    pallet963 - surface
    crate560 - surface
    pallet560 - surface
    crate793 - surface
    pallet793 - surface
    crate974 - surface
    pallet974 - surface
    crate265 - surface
    pallet265 - surface
    crate552 - surface
    pallet552 - surface
    crate219 - surface
    pallet219 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist776 place776 )
    ( available hoist776 )
    ( hoist-at hoist72 place72 )
    ( available hoist72 )
    ( hoist-at hoist193 place193 )
    ( available hoist193 )
    ( hoist-at hoist252 place252 )
    ( available hoist252 )
    ( hoist-at hoist513 place513 )
    ( available hoist513 )
    ( hoist-at hoist593 place593 )
    ( available hoist593 )
    ( hoist-at hoist631 place631 )
    ( available hoist631 )
    ( hoist-at hoist644 place644 )
    ( available hoist644 )
    ( hoist-at hoist34 place34 )
    ( available hoist34 )
    ( hoist-at hoist578 place578 )
    ( available hoist578 )
    ( hoist-at hoist745 place745 )
    ( available hoist745 )
    ( hoist-at hoist428 place428 )
    ( available hoist428 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet963 place428 )
    ( surface-at crate963 place428 )
    ( on crate963 pallet963 )
    ( is-crate crate963 )
    ( clear crate963 )
    ( surface-at pallet560 place593 )
    ( surface-at crate560 place593 )
    ( on crate560 pallet560 )
    ( is-crate crate560 )
    ( clear crate560 )
    ( surface-at pallet793 place428 )
    ( surface-at crate793 place428 )
    ( on crate793 pallet793 )
    ( is-crate crate793 )
    ( clear crate793 )
    ( surface-at pallet974 place428 )
    ( surface-at crate974 place428 )
    ( on crate974 pallet974 )
    ( is-crate crate974 )
    ( clear crate974 )
    ( surface-at pallet265 place428 )
    ( surface-at crate265 place428 )
    ( on crate265 pallet265 )
    ( is-crate crate265 )
    ( clear crate265 )
    ( surface-at pallet552 place72 )
    ( surface-at crate552 place72 )
    ( on crate552 pallet552 )
    ( is-crate crate552 )
    ( clear crate552 )
    ( surface-at pallet219 place252 )
    ( surface-at crate219 place252 )
    ( on crate219 pallet219 )
    ( is-crate crate219 )
    ( clear crate219 )
  )
  ( :goal
    ( and
    )
  )
)
