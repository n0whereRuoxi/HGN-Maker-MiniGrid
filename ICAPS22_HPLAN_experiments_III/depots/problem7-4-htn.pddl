( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place36 - place
    hoist36 - hoist
    place121 - place
    hoist121 - hoist
    place362 - place
    hoist362 - hoist
    place564 - place
    hoist564 - hoist
    place439 - place
    hoist439 - hoist
    place268 - place
    hoist268 - hoist
    place673 - place
    hoist673 - hoist
    place613 - place
    hoist613 - hoist
    place594 - place
    hoist594 - hoist
    place0 - place
    hoist0 - hoist
    crate463 - surface
    pallet463 - surface
    crate434 - surface
    pallet434 - surface
    crate192 - surface
    pallet192 - surface
    crate490 - surface
    pallet490 - surface
    crate79 - surface
    pallet79 - surface
    crate772 - surface
    pallet772 - surface
    crate932 - surface
    pallet932 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist36 place36 )
    ( available hoist36 )
    ( hoist-at hoist121 place121 )
    ( available hoist121 )
    ( hoist-at hoist362 place362 )
    ( available hoist362 )
    ( hoist-at hoist564 place564 )
    ( available hoist564 )
    ( hoist-at hoist439 place439 )
    ( available hoist439 )
    ( hoist-at hoist268 place268 )
    ( available hoist268 )
    ( hoist-at hoist673 place673 )
    ( available hoist673 )
    ( hoist-at hoist613 place613 )
    ( available hoist613 )
    ( hoist-at hoist594 place594 )
    ( available hoist594 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet463 place121 )
    ( surface-at crate463 place121 )
    ( on crate463 pallet463 )
    ( is-crate crate463 )
    ( clear crate463 )
    ( surface-at pallet434 place36 )
    ( surface-at crate434 place36 )
    ( on crate434 pallet434 )
    ( is-crate crate434 )
    ( clear crate434 )
    ( surface-at pallet192 place268 )
    ( surface-at crate192 place268 )
    ( on crate192 pallet192 )
    ( is-crate crate192 )
    ( clear crate192 )
    ( surface-at pallet490 place673 )
    ( surface-at crate490 place673 )
    ( on crate490 pallet490 )
    ( is-crate crate490 )
    ( clear crate490 )
    ( surface-at pallet79 place594 )
    ( surface-at crate79 place594 )
    ( on crate79 pallet79 )
    ( is-crate crate79 )
    ( clear crate79 )
    ( surface-at pallet772 place564 )
    ( surface-at crate772 place564 )
    ( on crate772 pallet772 )
    ( is-crate crate772 )
    ( clear crate772 )
    ( surface-at pallet932 place564 )
    ( surface-at crate932 place564 )
    ( on crate932 pallet932 )
    ( is-crate crate932 )
    ( clear crate932 )
  )
  ( :tasks
    ( Make-7Crate pallet0 crate463 crate434 crate192 crate490 crate79 crate772 crate932 )
  )
)
