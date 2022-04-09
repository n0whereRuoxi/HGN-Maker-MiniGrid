( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place939 - place
    hoist939 - hoist
    place906 - place
    hoist906 - hoist
    place431 - place
    hoist431 - hoist
    place968 - place
    hoist968 - hoist
    place914 - place
    hoist914 - hoist
    place284 - place
    hoist284 - hoist
    place313 - place
    hoist313 - hoist
    place804 - place
    hoist804 - hoist
    place468 - place
    hoist468 - hoist
    place22 - place
    hoist22 - hoist
    place726 - place
    hoist726 - hoist
    place422 - place
    hoist422 - hoist
    place639 - place
    hoist639 - hoist
    place486 - place
    hoist486 - hoist
    place339 - place
    hoist339 - hoist
    place715 - place
    hoist715 - hoist
    place103 - place
    hoist103 - hoist
    place762 - place
    hoist762 - hoist
    place520 - place
    hoist520 - hoist
    place0 - place
    hoist0 - hoist
    crate933 - surface
    pallet933 - surface
    crate242 - surface
    pallet242 - surface
    crate504 - surface
    pallet504 - surface
    crate718 - surface
    pallet718 - surface
    crate910 - surface
    pallet910 - surface
    crate510 - surface
    pallet510 - surface
    crate911 - surface
    pallet911 - surface
    crate216 - surface
    pallet216 - surface
    crate238 - surface
    pallet238 - surface
    crate289 - surface
    pallet289 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist939 place939 )
    ( available hoist939 )
    ( hoist-at hoist906 place906 )
    ( available hoist906 )
    ( hoist-at hoist431 place431 )
    ( available hoist431 )
    ( hoist-at hoist968 place968 )
    ( available hoist968 )
    ( hoist-at hoist914 place914 )
    ( available hoist914 )
    ( hoist-at hoist284 place284 )
    ( available hoist284 )
    ( hoist-at hoist313 place313 )
    ( available hoist313 )
    ( hoist-at hoist804 place804 )
    ( available hoist804 )
    ( hoist-at hoist468 place468 )
    ( available hoist468 )
    ( hoist-at hoist22 place22 )
    ( available hoist22 )
    ( hoist-at hoist726 place726 )
    ( available hoist726 )
    ( hoist-at hoist422 place422 )
    ( available hoist422 )
    ( hoist-at hoist639 place639 )
    ( available hoist639 )
    ( hoist-at hoist486 place486 )
    ( available hoist486 )
    ( hoist-at hoist339 place339 )
    ( available hoist339 )
    ( hoist-at hoist715 place715 )
    ( available hoist715 )
    ( hoist-at hoist103 place103 )
    ( available hoist103 )
    ( hoist-at hoist762 place762 )
    ( available hoist762 )
    ( hoist-at hoist520 place520 )
    ( available hoist520 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet933 place939 )
    ( surface-at crate933 place939 )
    ( on crate933 pallet933 )
    ( is-crate crate933 )
    ( clear crate933 )
    ( surface-at pallet242 place422 )
    ( surface-at crate242 place422 )
    ( on crate242 pallet242 )
    ( is-crate crate242 )
    ( clear crate242 )
    ( surface-at pallet504 place422 )
    ( surface-at crate504 place422 )
    ( on crate504 pallet504 )
    ( is-crate crate504 )
    ( clear crate504 )
    ( surface-at pallet718 place103 )
    ( surface-at crate718 place103 )
    ( on crate718 pallet718 )
    ( is-crate crate718 )
    ( clear crate718 )
    ( surface-at pallet910 place520 )
    ( surface-at crate910 place520 )
    ( on crate910 pallet910 )
    ( is-crate crate910 )
    ( clear crate910 )
    ( surface-at pallet510 place284 )
    ( surface-at crate510 place284 )
    ( on crate510 pallet510 )
    ( is-crate crate510 )
    ( clear crate510 )
    ( surface-at pallet911 place715 )
    ( surface-at crate911 place715 )
    ( on crate911 pallet911 )
    ( is-crate crate911 )
    ( clear crate911 )
    ( surface-at pallet216 place284 )
    ( surface-at crate216 place284 )
    ( on crate216 pallet216 )
    ( is-crate crate216 )
    ( clear crate216 )
    ( surface-at pallet238 place906 )
    ( surface-at crate238 place906 )
    ( on crate238 pallet238 )
    ( is-crate crate238 )
    ( clear crate238 )
    ( surface-at pallet289 place939 )
    ( surface-at crate289 place939 )
    ( on crate289 pallet289 )
    ( is-crate crate289 )
    ( clear crate289 )
  )
  ( :goal
    ( and
    )
  )
)
