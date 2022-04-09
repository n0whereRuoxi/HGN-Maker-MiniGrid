( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place767 - place
    hoist767 - hoist
    place880 - place
    hoist880 - hoist
    place174 - place
    hoist174 - hoist
    place839 - place
    hoist839 - hoist
    place612 - place
    hoist612 - hoist
    place209 - place
    hoist209 - hoist
    place180 - place
    hoist180 - hoist
    place842 - place
    hoist842 - hoist
    place302 - place
    hoist302 - hoist
    place885 - place
    hoist885 - hoist
    place950 - place
    hoist950 - hoist
    place352 - place
    hoist352 - hoist
    place112 - place
    hoist112 - hoist
    place864 - place
    hoist864 - hoist
    place734 - place
    hoist734 - hoist
    place814 - place
    hoist814 - hoist
    place471 - place
    hoist471 - hoist
    place293 - place
    hoist293 - hoist
    place253 - place
    hoist253 - hoist
    place491 - place
    hoist491 - hoist
    place0 - place
    hoist0 - hoist
    crate52 - surface
    pallet52 - surface
    crate792 - surface
    pallet792 - surface
    crate854 - surface
    pallet854 - surface
    crate548 - surface
    pallet548 - surface
    crate916 - surface
    pallet916 - surface
    crate112 - surface
    pallet112 - surface
    crate191 - surface
    pallet191 - surface
    crate404 - surface
    pallet404 - surface
    crate352 - surface
    pallet352 - surface
    crate301 - surface
    pallet301 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist767 place767 )
    ( available hoist767 )
    ( hoist-at hoist880 place880 )
    ( available hoist880 )
    ( hoist-at hoist174 place174 )
    ( available hoist174 )
    ( hoist-at hoist839 place839 )
    ( available hoist839 )
    ( hoist-at hoist612 place612 )
    ( available hoist612 )
    ( hoist-at hoist209 place209 )
    ( available hoist209 )
    ( hoist-at hoist180 place180 )
    ( available hoist180 )
    ( hoist-at hoist842 place842 )
    ( available hoist842 )
    ( hoist-at hoist302 place302 )
    ( available hoist302 )
    ( hoist-at hoist885 place885 )
    ( available hoist885 )
    ( hoist-at hoist950 place950 )
    ( available hoist950 )
    ( hoist-at hoist352 place352 )
    ( available hoist352 )
    ( hoist-at hoist112 place112 )
    ( available hoist112 )
    ( hoist-at hoist864 place864 )
    ( available hoist864 )
    ( hoist-at hoist734 place734 )
    ( available hoist734 )
    ( hoist-at hoist814 place814 )
    ( available hoist814 )
    ( hoist-at hoist471 place471 )
    ( available hoist471 )
    ( hoist-at hoist293 place293 )
    ( available hoist293 )
    ( hoist-at hoist253 place253 )
    ( available hoist253 )
    ( hoist-at hoist491 place491 )
    ( available hoist491 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet52 place864 )
    ( surface-at crate52 place864 )
    ( on crate52 pallet52 )
    ( is-crate crate52 )
    ( clear crate52 )
    ( surface-at pallet792 place880 )
    ( surface-at crate792 place880 )
    ( on crate792 pallet792 )
    ( is-crate crate792 )
    ( clear crate792 )
    ( surface-at pallet854 place253 )
    ( surface-at crate854 place253 )
    ( on crate854 pallet854 )
    ( is-crate crate854 )
    ( clear crate854 )
    ( surface-at pallet548 place885 )
    ( surface-at crate548 place885 )
    ( on crate548 pallet548 )
    ( is-crate crate548 )
    ( clear crate548 )
    ( surface-at pallet916 place839 )
    ( surface-at crate916 place839 )
    ( on crate916 pallet916 )
    ( is-crate crate916 )
    ( clear crate916 )
    ( surface-at pallet112 place767 )
    ( surface-at crate112 place767 )
    ( on crate112 pallet112 )
    ( is-crate crate112 )
    ( clear crate112 )
    ( surface-at pallet191 place839 )
    ( surface-at crate191 place839 )
    ( on crate191 pallet191 )
    ( is-crate crate191 )
    ( clear crate191 )
    ( surface-at pallet404 place814 )
    ( surface-at crate404 place814 )
    ( on crate404 pallet404 )
    ( is-crate crate404 )
    ( clear crate404 )
    ( surface-at pallet352 place180 )
    ( surface-at crate352 place180 )
    ( on crate352 pallet352 )
    ( is-crate crate352 )
    ( clear crate352 )
    ( surface-at pallet301 place612 )
    ( surface-at crate301 place612 )
    ( on crate301 pallet301 )
    ( is-crate crate301 )
    ( clear crate301 )
  )
  ( :goal
    ( and
    )
  )
)
