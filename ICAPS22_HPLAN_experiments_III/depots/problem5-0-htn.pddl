( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place643 - place
    hoist643 - hoist
    place857 - place
    hoist857 - hoist
    place0 - place
    hoist0 - hoist
    crate633 - surface
    pallet633 - surface
    crate232 - surface
    pallet232 - surface
    crate319 - surface
    pallet319 - surface
    crate780 - surface
    pallet780 - surface
    crate492 - surface
    pallet492 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist643 place643 )
    ( available hoist643 )
    ( hoist-at hoist857 place857 )
    ( available hoist857 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet633 place643 )
    ( surface-at crate633 place643 )
    ( on crate633 pallet633 )
    ( is-crate crate633 )
    ( clear crate633 )
    ( surface-at pallet232 place643 )
    ( surface-at crate232 place643 )
    ( on crate232 pallet232 )
    ( is-crate crate232 )
    ( clear crate232 )
    ( surface-at pallet319 place857 )
    ( surface-at crate319 place857 )
    ( on crate319 pallet319 )
    ( is-crate crate319 )
    ( clear crate319 )
    ( surface-at pallet780 place643 )
    ( surface-at crate780 place643 )
    ( on crate780 pallet780 )
    ( is-crate crate780 )
    ( clear crate780 )
    ( surface-at pallet492 place643 )
    ( surface-at crate492 place643 )
    ( on crate492 pallet492 )
    ( is-crate crate492 )
    ( clear crate492 )
  )
  ( :tasks
    ( Make-5Crate crate633 crate232 crate319 crate780 crate492 l000 )
  )
)
