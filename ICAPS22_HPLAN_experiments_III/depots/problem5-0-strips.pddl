( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    place977 - place
    hoist977 - hoist
    place42 - place
    hoist42 - hoist
    place664 - place
    hoist664 - hoist
    place279 - place
    hoist279 - hoist
    place87 - place
    hoist87 - hoist
    place865 - place
    hoist865 - hoist
    place884 - place
    hoist884 - hoist
    place242 - place
    hoist242 - hoist
    place0 - place
    hoist0 - hoist
    crate835 - surface
    pallet835 - surface
    crate590 - surface
    pallet590 - surface
    crate827 - surface
    pallet827 - surface
    crate267 - surface
    pallet267 - surface
    crate161 - surface
    pallet161 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist977 place977 )
    ( available hoist977 )
    ( hoist-at hoist42 place42 )
    ( available hoist42 )
    ( hoist-at hoist664 place664 )
    ( available hoist664 )
    ( hoist-at hoist279 place279 )
    ( available hoist279 )
    ( hoist-at hoist87 place87 )
    ( available hoist87 )
    ( hoist-at hoist865 place865 )
    ( available hoist865 )
    ( hoist-at hoist884 place884 )
    ( available hoist884 )
    ( hoist-at hoist242 place242 )
    ( available hoist242 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet835 place865 )
    ( surface-at crate835 place865 )
    ( on crate835 pallet835 )
    ( is-crate crate835 )
    ( clear crate835 )
    ( surface-at pallet590 place884 )
    ( surface-at crate590 place884 )
    ( on crate590 pallet590 )
    ( is-crate crate590 )
    ( clear crate590 )
    ( surface-at pallet827 place87 )
    ( surface-at crate827 place87 )
    ( on crate827 pallet827 )
    ( is-crate crate827 )
    ( clear crate827 )
    ( surface-at pallet267 place279 )
    ( surface-at crate267 place279 )
    ( on crate267 pallet267 )
    ( is-crate crate267 )
    ( clear crate267 )
    ( surface-at pallet161 place279 )
    ( surface-at crate161 place279 )
    ( on crate161 pallet161 )
    ( is-crate crate161 )
    ( clear crate161 )
  )
  ( :goal
    ( and
    )
  )
)
