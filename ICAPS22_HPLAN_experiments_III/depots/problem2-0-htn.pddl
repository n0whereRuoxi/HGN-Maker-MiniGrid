( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place99 - place
    hoist99 - hoist
    place159 - place
    hoist159 - hoist
    place110 - place
    hoist110 - hoist
    place433 - place
    hoist433 - hoist
    place0 - place
    hoist0 - hoist
    crate986 - surface
    pallet986 - surface
    crate458 - surface
    pallet458 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist99 place99 )
    ( available hoist99 )
    ( hoist-at hoist159 place159 )
    ( available hoist159 )
    ( hoist-at hoist110 place110 )
    ( available hoist110 )
    ( hoist-at hoist433 place433 )
    ( available hoist433 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet986 place110 )
    ( surface-at crate986 place110 )
    ( on crate986 pallet986 )
    ( is-crate crate986 )
    ( clear crate986 )
    ( surface-at pallet458 place99 )
    ( surface-at crate458 place99 )
    ( on crate458 pallet458 )
    ( is-crate crate458 )
    ( clear crate458 )
  )
  ( :tasks
    ( Make-2Crate crate986 crate458 l000 )
  )
)
