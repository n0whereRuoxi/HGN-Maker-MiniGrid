( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place427 - place
    hoist427 - hoist
    place205 - place
    hoist205 - hoist
    place664 - place
    hoist664 - hoist
    place711 - place
    hoist711 - hoist
    place149 - place
    hoist149 - hoist
    place745 - place
    hoist745 - hoist
    place783 - place
    hoist783 - hoist
    place224 - place
    hoist224 - hoist
    place614 - place
    hoist614 - hoist
    place0 - place
    hoist0 - hoist
    crate236 - surface
    pallet236 - surface
    crate330 - surface
    pallet330 - surface
    crate34 - surface
    pallet34 - surface
    crate411 - surface
    pallet411 - surface
    crate502 - surface
    pallet502 - surface
    crate631 - surface
    pallet631 - surface
    crate851 - surface
    pallet851 - surface
    crate424 - surface
    pallet424 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist427 place427 )
    ( available hoist427 )
    ( hoist-at hoist205 place205 )
    ( available hoist205 )
    ( hoist-at hoist664 place664 )
    ( available hoist664 )
    ( hoist-at hoist711 place711 )
    ( available hoist711 )
    ( hoist-at hoist149 place149 )
    ( available hoist149 )
    ( hoist-at hoist745 place745 )
    ( available hoist745 )
    ( hoist-at hoist783 place783 )
    ( available hoist783 )
    ( hoist-at hoist224 place224 )
    ( available hoist224 )
    ( hoist-at hoist614 place614 )
    ( available hoist614 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet236 place711 )
    ( surface-at crate236 place711 )
    ( on crate236 pallet236 )
    ( is-crate crate236 )
    ( clear crate236 )
    ( surface-at pallet330 place711 )
    ( surface-at crate330 place711 )
    ( on crate330 pallet330 )
    ( is-crate crate330 )
    ( clear crate330 )
    ( surface-at pallet34 place205 )
    ( surface-at crate34 place205 )
    ( on crate34 pallet34 )
    ( is-crate crate34 )
    ( clear crate34 )
    ( surface-at pallet411 place224 )
    ( surface-at crate411 place224 )
    ( on crate411 pallet411 )
    ( is-crate crate411 )
    ( clear crate411 )
    ( surface-at pallet502 place664 )
    ( surface-at crate502 place664 )
    ( on crate502 pallet502 )
    ( is-crate crate502 )
    ( clear crate502 )
    ( surface-at pallet631 place745 )
    ( surface-at crate631 place745 )
    ( on crate631 pallet631 )
    ( is-crate crate631 )
    ( clear crate631 )
    ( surface-at pallet851 place149 )
    ( surface-at crate851 place149 )
    ( on crate851 pallet851 )
    ( is-crate crate851 )
    ( clear crate851 )
    ( surface-at pallet424 place664 )
    ( surface-at crate424 place664 )
    ( on crate424 pallet424 )
    ( is-crate crate424 )
    ( clear crate424 )
  )
  ( :goal
    ( and
    )
  )
)
