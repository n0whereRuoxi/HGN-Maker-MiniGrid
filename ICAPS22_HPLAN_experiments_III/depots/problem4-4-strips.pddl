( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place650 - place
    hoist650 - hoist
    place529 - place
    hoist529 - hoist
    place151 - place
    hoist151 - hoist
    place626 - place
    hoist626 - hoist
    place25 - place
    hoist25 - hoist
    place750 - place
    hoist750 - hoist
    place954 - place
    hoist954 - hoist
    place0 - place
    hoist0 - hoist
    crate199 - surface
    pallet199 - surface
    crate892 - surface
    pallet892 - surface
    crate2 - surface
    pallet2 - surface
    crate910 - surface
    pallet910 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist650 place650 )
    ( available hoist650 )
    ( hoist-at hoist529 place529 )
    ( available hoist529 )
    ( hoist-at hoist151 place151 )
    ( available hoist151 )
    ( hoist-at hoist626 place626 )
    ( available hoist626 )
    ( hoist-at hoist25 place25 )
    ( available hoist25 )
    ( hoist-at hoist750 place750 )
    ( available hoist750 )
    ( hoist-at hoist954 place954 )
    ( available hoist954 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet199 place25 )
    ( surface-at crate199 place25 )
    ( on crate199 pallet199 )
    ( is-crate crate199 )
    ( clear crate199 )
    ( surface-at pallet892 place650 )
    ( surface-at crate892 place650 )
    ( on crate892 pallet892 )
    ( is-crate crate892 )
    ( clear crate892 )
    ( surface-at pallet2 place750 )
    ( surface-at crate2 place750 )
    ( on crate2 pallet2 )
    ( is-crate crate2 )
    ( clear crate2 )
    ( surface-at pallet910 place529 )
    ( surface-at crate910 place529 )
    ( on crate910 pallet910 )
    ( is-crate crate910 )
    ( clear crate910 )
  )
  ( :goal
    ( and
    )
  )
)
