( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place922 - place
    hoist922 - hoist
    place794 - place
    hoist794 - hoist
    place534 - place
    hoist534 - hoist
    place855 - place
    hoist855 - hoist
    place0 - place
    hoist0 - hoist
    crate749 - surface
    pallet749 - surface
    crate794 - surface
    pallet794 - surface
    crate627 - surface
    pallet627 - surface
    crate996 - surface
    pallet996 - surface
    crate731 - surface
    pallet731 - surface
    crate766 - surface
    pallet766 - surface
    crate203 - surface
    pallet203 - surface
    crate269 - surface
    pallet269 - surface
    crate360 - surface
    pallet360 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist922 place922 )
    ( available hoist922 )
    ( hoist-at hoist794 place794 )
    ( available hoist794 )
    ( hoist-at hoist534 place534 )
    ( available hoist534 )
    ( hoist-at hoist855 place855 )
    ( available hoist855 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet749 place855 )
    ( surface-at crate749 place855 )
    ( on crate749 pallet749 )
    ( is-crate crate749 )
    ( clear crate749 )
    ( surface-at pallet794 place922 )
    ( surface-at crate794 place922 )
    ( on crate794 pallet794 )
    ( is-crate crate794 )
    ( clear crate794 )
    ( surface-at pallet627 place794 )
    ( surface-at crate627 place794 )
    ( on crate627 pallet627 )
    ( is-crate crate627 )
    ( clear crate627 )
    ( surface-at pallet996 place794 )
    ( surface-at crate996 place794 )
    ( on crate996 pallet996 )
    ( is-crate crate996 )
    ( clear crate996 )
    ( surface-at pallet731 place855 )
    ( surface-at crate731 place855 )
    ( on crate731 pallet731 )
    ( is-crate crate731 )
    ( clear crate731 )
    ( surface-at pallet766 place794 )
    ( surface-at crate766 place794 )
    ( on crate766 pallet766 )
    ( is-crate crate766 )
    ( clear crate766 )
    ( surface-at pallet203 place534 )
    ( surface-at crate203 place534 )
    ( on crate203 pallet203 )
    ( is-crate crate203 )
    ( clear crate203 )
    ( surface-at pallet269 place794 )
    ( surface-at crate269 place794 )
    ( on crate269 pallet269 )
    ( is-crate crate269 )
    ( clear crate269 )
    ( surface-at pallet360 place794 )
    ( surface-at crate360 place794 )
    ( on crate360 pallet360 )
    ( is-crate crate360 )
    ( clear crate360 )
  )
  ( :goal
    ( and
    )
  )
)
