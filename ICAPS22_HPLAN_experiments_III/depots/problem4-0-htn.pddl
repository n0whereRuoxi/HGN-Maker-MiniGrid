( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place756 - place
    hoist756 - hoist
    place885 - place
    hoist885 - hoist
    place867 - place
    hoist867 - hoist
    place959 - place
    hoist959 - hoist
    place833 - place
    hoist833 - hoist
    place440 - place
    hoist440 - hoist
    place0 - place
    hoist0 - hoist
    crate162 - surface
    pallet162 - surface
    crate534 - surface
    pallet534 - surface
    crate958 - surface
    pallet958 - surface
    crate785 - surface
    pallet785 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist756 place756 )
    ( available hoist756 )
    ( hoist-at hoist885 place885 )
    ( available hoist885 )
    ( hoist-at hoist867 place867 )
    ( available hoist867 )
    ( hoist-at hoist959 place959 )
    ( available hoist959 )
    ( hoist-at hoist833 place833 )
    ( available hoist833 )
    ( hoist-at hoist440 place440 )
    ( available hoist440 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet162 place867 )
    ( surface-at crate162 place867 )
    ( on crate162 pallet162 )
    ( is-crate crate162 )
    ( clear crate162 )
    ( surface-at pallet534 place885 )
    ( surface-at crate534 place885 )
    ( on crate534 pallet534 )
    ( is-crate crate534 )
    ( clear crate534 )
    ( surface-at pallet958 place833 )
    ( surface-at crate958 place833 )
    ( on crate958 pallet958 )
    ( is-crate crate958 )
    ( clear crate958 )
    ( surface-at pallet785 place867 )
    ( surface-at crate785 place867 )
    ( on crate785 pallet785 )
    ( is-crate crate785 )
    ( clear crate785 )
  )
  ( :tasks
    ( Make-4Crate crate162 crate534 crate958 crate785 l000 )
  )
)
