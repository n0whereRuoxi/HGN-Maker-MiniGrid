( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place758 - place
    hoist758 - hoist
    place564 - place
    hoist564 - hoist
    place399 - place
    hoist399 - hoist
    place0 - place
    hoist0 - hoist
    crate957 - surface
    pallet957 - surface
    crate262 - surface
    pallet262 - surface
    crate188 - surface
    pallet188 - surface
    crate151 - surface
    pallet151 - surface
    crate242 - surface
    pallet242 - surface
    crate54 - surface
    pallet54 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist758 place758 )
    ( available hoist758 )
    ( hoist-at hoist564 place564 )
    ( available hoist564 )
    ( hoist-at hoist399 place399 )
    ( available hoist399 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet957 place399 )
    ( surface-at crate957 place399 )
    ( on crate957 pallet957 )
    ( is-crate crate957 )
    ( clear crate957 )
    ( surface-at pallet262 place564 )
    ( surface-at crate262 place564 )
    ( on crate262 pallet262 )
    ( is-crate crate262 )
    ( clear crate262 )
    ( surface-at pallet188 place399 )
    ( surface-at crate188 place399 )
    ( on crate188 pallet188 )
    ( is-crate crate188 )
    ( clear crate188 )
    ( surface-at pallet151 place564 )
    ( surface-at crate151 place564 )
    ( on crate151 pallet151 )
    ( is-crate crate151 )
    ( clear crate151 )
    ( surface-at pallet242 place758 )
    ( surface-at crate242 place758 )
    ( on crate242 pallet242 )
    ( is-crate crate242 )
    ( clear crate242 )
    ( surface-at pallet54 place399 )
    ( surface-at crate54 place399 )
    ( on crate54 pallet54 )
    ( is-crate crate54 )
    ( clear crate54 )
  )
  ( :goal
    ( and
    )
  )
)
