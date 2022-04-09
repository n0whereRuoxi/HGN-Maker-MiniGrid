( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place306 - place
    hoist306 - hoist
    place745 - place
    hoist745 - hoist
    place841 - place
    hoist841 - hoist
    place592 - place
    hoist592 - hoist
    place501 - place
    hoist501 - hoist
    place469 - place
    hoist469 - hoist
    place0 - place
    hoist0 - hoist
    crate645 - surface
    pallet645 - surface
    crate86 - surface
    pallet86 - surface
    crate66 - surface
    pallet66 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist306 place306 )
    ( available hoist306 )
    ( hoist-at hoist745 place745 )
    ( available hoist745 )
    ( hoist-at hoist841 place841 )
    ( available hoist841 )
    ( hoist-at hoist592 place592 )
    ( available hoist592 )
    ( hoist-at hoist501 place501 )
    ( available hoist501 )
    ( hoist-at hoist469 place469 )
    ( available hoist469 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet645 place745 )
    ( surface-at crate645 place745 )
    ( on crate645 pallet645 )
    ( is-crate crate645 )
    ( clear crate645 )
    ( surface-at pallet86 place501 )
    ( surface-at crate86 place501 )
    ( on crate86 pallet86 )
    ( is-crate crate86 )
    ( clear crate86 )
    ( surface-at pallet66 place592 )
    ( surface-at crate66 place592 )
    ( on crate66 pallet66 )
    ( is-crate crate66 )
    ( clear crate66 )
  )
  ( :goal
    ( and
    )
  )
)
