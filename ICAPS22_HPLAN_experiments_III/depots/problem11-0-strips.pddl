( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place2 - place
    hoist2 - hoist
    place256 - place
    hoist256 - hoist
    place337 - place
    hoist337 - hoist
    place119 - place
    hoist119 - hoist
    place663 - place
    hoist663 - hoist
    place617 - place
    hoist617 - hoist
    place597 - place
    hoist597 - hoist
    place535 - place
    hoist535 - hoist
    place11 - place
    hoist11 - hoist
    place621 - place
    hoist621 - hoist
    place680 - place
    hoist680 - hoist
    place974 - place
    hoist974 - hoist
    place484 - place
    hoist484 - hoist
    place412 - place
    hoist412 - hoist
    place826 - place
    hoist826 - hoist
    place0 - place
    hoist0 - hoist
    crate687 - surface
    pallet687 - surface
    crate984 - surface
    pallet984 - surface
    crate931 - surface
    pallet931 - surface
    crate527 - surface
    pallet527 - surface
    crate175 - surface
    pallet175 - surface
    crate904 - surface
    pallet904 - surface
    crate909 - surface
    pallet909 - surface
    crate743 - surface
    pallet743 - surface
    crate635 - surface
    pallet635 - surface
    crate815 - surface
    pallet815 - surface
    crate854 - surface
    pallet854 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist2 place2 )
    ( available hoist2 )
    ( hoist-at hoist256 place256 )
    ( available hoist256 )
    ( hoist-at hoist337 place337 )
    ( available hoist337 )
    ( hoist-at hoist119 place119 )
    ( available hoist119 )
    ( hoist-at hoist663 place663 )
    ( available hoist663 )
    ( hoist-at hoist617 place617 )
    ( available hoist617 )
    ( hoist-at hoist597 place597 )
    ( available hoist597 )
    ( hoist-at hoist535 place535 )
    ( available hoist535 )
    ( hoist-at hoist11 place11 )
    ( available hoist11 )
    ( hoist-at hoist621 place621 )
    ( available hoist621 )
    ( hoist-at hoist680 place680 )
    ( available hoist680 )
    ( hoist-at hoist974 place974 )
    ( available hoist974 )
    ( hoist-at hoist484 place484 )
    ( available hoist484 )
    ( hoist-at hoist412 place412 )
    ( available hoist412 )
    ( hoist-at hoist826 place826 )
    ( available hoist826 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet687 place617 )
    ( surface-at crate687 place617 )
    ( on crate687 pallet687 )
    ( is-crate crate687 )
    ( clear crate687 )
    ( surface-at pallet984 place119 )
    ( surface-at crate984 place119 )
    ( on crate984 pallet984 )
    ( is-crate crate984 )
    ( clear crate984 )
    ( surface-at pallet931 place535 )
    ( surface-at crate931 place535 )
    ( on crate931 pallet931 )
    ( is-crate crate931 )
    ( clear crate931 )
    ( surface-at pallet527 place2 )
    ( surface-at crate527 place2 )
    ( on crate527 pallet527 )
    ( is-crate crate527 )
    ( clear crate527 )
    ( surface-at pallet175 place412 )
    ( surface-at crate175 place412 )
    ( on crate175 pallet175 )
    ( is-crate crate175 )
    ( clear crate175 )
    ( surface-at pallet904 place2 )
    ( surface-at crate904 place2 )
    ( on crate904 pallet904 )
    ( is-crate crate904 )
    ( clear crate904 )
    ( surface-at pallet909 place484 )
    ( surface-at crate909 place484 )
    ( on crate909 pallet909 )
    ( is-crate crate909 )
    ( clear crate909 )
    ( surface-at pallet743 place484 )
    ( surface-at crate743 place484 )
    ( on crate743 pallet743 )
    ( is-crate crate743 )
    ( clear crate743 )
    ( surface-at pallet635 place617 )
    ( surface-at crate635 place617 )
    ( on crate635 pallet635 )
    ( is-crate crate635 )
    ( clear crate635 )
    ( surface-at pallet815 place535 )
    ( surface-at crate815 place535 )
    ( on crate815 pallet815 )
    ( is-crate crate815 )
    ( clear crate815 )
    ( surface-at pallet854 place621 )
    ( surface-at crate854 place621 )
    ( on crate854 pallet854 )
    ( is-crate crate854 )
    ( clear crate854 )
  )
  ( :goal
    ( and
    )
  )
)
