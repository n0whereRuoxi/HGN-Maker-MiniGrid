( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place950 - place
    hoist950 - hoist
    place678 - place
    hoist678 - hoist
    place350 - place
    hoist350 - hoist
    place701 - place
    hoist701 - hoist
    place997 - place
    hoist997 - hoist
    place78 - place
    hoist78 - hoist
    place919 - place
    hoist919 - hoist
    place0 - place
    hoist0 - hoist
    crate64 - surface
    pallet64 - surface
    crate996 - surface
    pallet996 - surface
    crate195 - surface
    pallet195 - surface
    crate375 - surface
    pallet375 - surface
    crate705 - surface
    pallet705 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist950 place950 )
    ( available hoist950 )
    ( hoist-at hoist678 place678 )
    ( available hoist678 )
    ( hoist-at hoist350 place350 )
    ( available hoist350 )
    ( hoist-at hoist701 place701 )
    ( available hoist701 )
    ( hoist-at hoist997 place997 )
    ( available hoist997 )
    ( hoist-at hoist78 place78 )
    ( available hoist78 )
    ( hoist-at hoist919 place919 )
    ( available hoist919 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet64 place78 )
    ( surface-at crate64 place78 )
    ( on crate64 pallet64 )
    ( is-crate crate64 )
    ( clear crate64 )
    ( surface-at pallet996 place701 )
    ( surface-at crate996 place701 )
    ( on crate996 pallet996 )
    ( is-crate crate996 )
    ( clear crate996 )
    ( surface-at pallet195 place350 )
    ( surface-at crate195 place350 )
    ( on crate195 pallet195 )
    ( is-crate crate195 )
    ( clear crate195 )
    ( surface-at pallet375 place997 )
    ( surface-at crate375 place997 )
    ( on crate375 pallet375 )
    ( is-crate crate375 )
    ( clear crate375 )
    ( surface-at pallet705 place78 )
    ( surface-at crate705 place78 )
    ( on crate705 pallet705 )
    ( is-crate crate705 )
    ( clear crate705 )
  )
  ( :goal
    ( and
    )
  )
)
