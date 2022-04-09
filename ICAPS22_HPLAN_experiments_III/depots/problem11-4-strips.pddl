( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place903 - place
    hoist903 - hoist
    place31 - place
    hoist31 - hoist
    place838 - place
    hoist838 - hoist
    place407 - place
    hoist407 - hoist
    place478 - place
    hoist478 - hoist
    place247 - place
    hoist247 - hoist
    place82 - place
    hoist82 - hoist
    place580 - place
    hoist580 - hoist
    place188 - place
    hoist188 - hoist
    place443 - place
    hoist443 - hoist
    place173 - place
    hoist173 - hoist
    place0 - place
    hoist0 - hoist
    crate505 - surface
    pallet505 - surface
    crate307 - surface
    pallet307 - surface
    crate871 - surface
    pallet871 - surface
    crate389 - surface
    pallet389 - surface
    crate741 - surface
    pallet741 - surface
    crate761 - surface
    pallet761 - surface
    crate516 - surface
    pallet516 - surface
    crate571 - surface
    pallet571 - surface
    crate237 - surface
    pallet237 - surface
    crate273 - surface
    pallet273 - surface
    crate950 - surface
    pallet950 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist903 place903 )
    ( available hoist903 )
    ( hoist-at hoist31 place31 )
    ( available hoist31 )
    ( hoist-at hoist838 place838 )
    ( available hoist838 )
    ( hoist-at hoist407 place407 )
    ( available hoist407 )
    ( hoist-at hoist478 place478 )
    ( available hoist478 )
    ( hoist-at hoist247 place247 )
    ( available hoist247 )
    ( hoist-at hoist82 place82 )
    ( available hoist82 )
    ( hoist-at hoist580 place580 )
    ( available hoist580 )
    ( hoist-at hoist188 place188 )
    ( available hoist188 )
    ( hoist-at hoist443 place443 )
    ( available hoist443 )
    ( hoist-at hoist173 place173 )
    ( available hoist173 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet505 place188 )
    ( surface-at crate505 place188 )
    ( on crate505 pallet505 )
    ( is-crate crate505 )
    ( clear crate505 )
    ( surface-at pallet307 place173 )
    ( surface-at crate307 place173 )
    ( on crate307 pallet307 )
    ( is-crate crate307 )
    ( clear crate307 )
    ( surface-at pallet871 place838 )
    ( surface-at crate871 place838 )
    ( on crate871 pallet871 )
    ( is-crate crate871 )
    ( clear crate871 )
    ( surface-at pallet389 place188 )
    ( surface-at crate389 place188 )
    ( on crate389 pallet389 )
    ( is-crate crate389 )
    ( clear crate389 )
    ( surface-at pallet741 place247 )
    ( surface-at crate741 place247 )
    ( on crate741 pallet741 )
    ( is-crate crate741 )
    ( clear crate741 )
    ( surface-at pallet761 place173 )
    ( surface-at crate761 place173 )
    ( on crate761 pallet761 )
    ( is-crate crate761 )
    ( clear crate761 )
    ( surface-at pallet516 place188 )
    ( surface-at crate516 place188 )
    ( on crate516 pallet516 )
    ( is-crate crate516 )
    ( clear crate516 )
    ( surface-at pallet571 place31 )
    ( surface-at crate571 place31 )
    ( on crate571 pallet571 )
    ( is-crate crate571 )
    ( clear crate571 )
    ( surface-at pallet237 place247 )
    ( surface-at crate237 place247 )
    ( on crate237 pallet237 )
    ( is-crate crate237 )
    ( clear crate237 )
    ( surface-at pallet273 place247 )
    ( surface-at crate273 place247 )
    ( on crate273 pallet273 )
    ( is-crate crate273 )
    ( clear crate273 )
    ( surface-at pallet950 place443 )
    ( surface-at crate950 place443 )
    ( on crate950 pallet950 )
    ( is-crate crate950 )
    ( clear crate950 )
  )
  ( :goal
    ( and
    )
  )
)
