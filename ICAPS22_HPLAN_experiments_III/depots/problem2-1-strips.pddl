( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place47 - place
    hoist47 - hoist
    place705 - place
    hoist705 - hoist
    place652 - place
    hoist652 - hoist
    place0 - place
    hoist0 - hoist
    crate615 - surface
    pallet615 - surface
    crate631 - surface
    pallet631 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist47 place47 )
    ( available hoist47 )
    ( hoist-at hoist705 place705 )
    ( available hoist705 )
    ( hoist-at hoist652 place652 )
    ( available hoist652 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet615 place47 )
    ( surface-at crate615 place47 )
    ( on crate615 pallet615 )
    ( is-crate crate615 )
    ( clear crate615 )
    ( surface-at pallet631 place652 )
    ( surface-at crate631 place652 )
    ( on crate631 pallet631 )
    ( is-crate crate631 )
    ( clear crate631 )
  )
  ( :goal
    ( and
    )
  )
)
