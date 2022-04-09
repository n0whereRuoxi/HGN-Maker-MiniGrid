( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place287 - place
    hoist287 - hoist
    place935 - place
    hoist935 - hoist
    place541 - place
    hoist541 - hoist
    place512 - place
    hoist512 - hoist
    place0 - place
    hoist0 - hoist
    crate711 - surface
    pallet711 - surface
    crate815 - surface
    pallet815 - surface
    crate266 - surface
    pallet266 - surface
    crate758 - surface
    pallet758 - surface
    crate613 - surface
    pallet613 - surface
    crate943 - surface
    pallet943 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist287 place287 )
    ( available hoist287 )
    ( hoist-at hoist935 place935 )
    ( available hoist935 )
    ( hoist-at hoist541 place541 )
    ( available hoist541 )
    ( hoist-at hoist512 place512 )
    ( available hoist512 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet711 place512 )
    ( surface-at crate711 place512 )
    ( on crate711 pallet711 )
    ( is-crate crate711 )
    ( clear crate711 )
    ( surface-at pallet815 place287 )
    ( surface-at crate815 place287 )
    ( on crate815 pallet815 )
    ( is-crate crate815 )
    ( clear crate815 )
    ( surface-at pallet266 place512 )
    ( surface-at crate266 place512 )
    ( on crate266 pallet266 )
    ( is-crate crate266 )
    ( clear crate266 )
    ( surface-at pallet758 place287 )
    ( surface-at crate758 place287 )
    ( on crate758 pallet758 )
    ( is-crate crate758 )
    ( clear crate758 )
    ( surface-at pallet613 place541 )
    ( surface-at crate613 place541 )
    ( on crate613 pallet613 )
    ( is-crate crate613 )
    ( clear crate613 )
    ( surface-at pallet943 place512 )
    ( surface-at crate943 place512 )
    ( on crate943 pallet943 )
    ( is-crate crate943 )
    ( clear crate943 )
  )
  ( :goal
    ( and
    )
  )
)
