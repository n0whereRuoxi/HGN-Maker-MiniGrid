( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place157 - place
    hoist157 - hoist
    place949 - place
    hoist949 - hoist
    place397 - place
    hoist397 - hoist
    place348 - place
    hoist348 - hoist
    place491 - place
    hoist491 - hoist
    place316 - place
    hoist316 - hoist
    place0 - place
    hoist0 - hoist
    crate230 - surface
    pallet230 - surface
    crate89 - surface
    pallet89 - surface
    crate821 - surface
    pallet821 - surface
    crate478 - surface
    pallet478 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist157 place157 )
    ( available hoist157 )
    ( hoist-at hoist949 place949 )
    ( available hoist949 )
    ( hoist-at hoist397 place397 )
    ( available hoist397 )
    ( hoist-at hoist348 place348 )
    ( available hoist348 )
    ( hoist-at hoist491 place491 )
    ( available hoist491 )
    ( hoist-at hoist316 place316 )
    ( available hoist316 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet230 place348 )
    ( surface-at crate230 place348 )
    ( on crate230 pallet230 )
    ( is-crate crate230 )
    ( clear crate230 )
    ( surface-at pallet89 place949 )
    ( surface-at crate89 place949 )
    ( on crate89 pallet89 )
    ( is-crate crate89 )
    ( clear crate89 )
    ( surface-at pallet821 place316 )
    ( surface-at crate821 place316 )
    ( on crate821 pallet821 )
    ( is-crate crate821 )
    ( clear crate821 )
    ( surface-at pallet478 place348 )
    ( surface-at crate478 place348 )
    ( on crate478 pallet478 )
    ( is-crate crate478 )
    ( clear crate478 )
  )
  ( :goal
    ( and
    )
  )
)
