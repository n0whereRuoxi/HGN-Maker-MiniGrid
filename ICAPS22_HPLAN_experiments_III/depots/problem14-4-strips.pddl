( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place620 - place
    hoist620 - hoist
    place727 - place
    hoist727 - hoist
    place259 - place
    hoist259 - hoist
    place624 - place
    hoist624 - hoist
    place931 - place
    hoist931 - hoist
    place994 - place
    hoist994 - hoist
    place487 - place
    hoist487 - hoist
    place731 - place
    hoist731 - hoist
    place949 - place
    hoist949 - hoist
    place513 - place
    hoist513 - hoist
    place707 - place
    hoist707 - hoist
    place493 - place
    hoist493 - hoist
    place231 - place
    hoist231 - hoist
    place152 - place
    hoist152 - hoist
    place164 - place
    hoist164 - hoist
    place867 - place
    hoist867 - hoist
    place637 - place
    hoist637 - hoist
    place957 - place
    hoist957 - hoist
    place12 - place
    hoist12 - hoist
    place621 - place
    hoist621 - hoist
    place744 - place
    hoist744 - hoist
    place461 - place
    hoist461 - hoist
    place182 - place
    hoist182 - hoist
    place843 - place
    hoist843 - hoist
    place618 - place
    hoist618 - hoist
    place541 - place
    hoist541 - hoist
    place11 - place
    hoist11 - hoist
    place784 - place
    hoist784 - hoist
    place0 - place
    hoist0 - hoist
    crate343 - surface
    pallet343 - surface
    crate591 - surface
    pallet591 - surface
    crate458 - surface
    pallet458 - surface
    crate654 - surface
    pallet654 - surface
    crate853 - surface
    pallet853 - surface
    crate989 - surface
    pallet989 - surface
    crate269 - surface
    pallet269 - surface
    crate277 - surface
    pallet277 - surface
    crate89 - surface
    pallet89 - surface
    crate911 - surface
    pallet911 - surface
    crate132 - surface
    pallet132 - surface
    crate120 - surface
    pallet120 - surface
    crate16 - surface
    pallet16 - surface
    crate130 - surface
    pallet130 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist620 place620 )
    ( available hoist620 )
    ( hoist-at hoist727 place727 )
    ( available hoist727 )
    ( hoist-at hoist259 place259 )
    ( available hoist259 )
    ( hoist-at hoist624 place624 )
    ( available hoist624 )
    ( hoist-at hoist931 place931 )
    ( available hoist931 )
    ( hoist-at hoist994 place994 )
    ( available hoist994 )
    ( hoist-at hoist487 place487 )
    ( available hoist487 )
    ( hoist-at hoist731 place731 )
    ( available hoist731 )
    ( hoist-at hoist949 place949 )
    ( available hoist949 )
    ( hoist-at hoist513 place513 )
    ( available hoist513 )
    ( hoist-at hoist707 place707 )
    ( available hoist707 )
    ( hoist-at hoist493 place493 )
    ( available hoist493 )
    ( hoist-at hoist231 place231 )
    ( available hoist231 )
    ( hoist-at hoist152 place152 )
    ( available hoist152 )
    ( hoist-at hoist164 place164 )
    ( available hoist164 )
    ( hoist-at hoist867 place867 )
    ( available hoist867 )
    ( hoist-at hoist637 place637 )
    ( available hoist637 )
    ( hoist-at hoist957 place957 )
    ( available hoist957 )
    ( hoist-at hoist12 place12 )
    ( available hoist12 )
    ( hoist-at hoist621 place621 )
    ( available hoist621 )
    ( hoist-at hoist744 place744 )
    ( available hoist744 )
    ( hoist-at hoist461 place461 )
    ( available hoist461 )
    ( hoist-at hoist182 place182 )
    ( available hoist182 )
    ( hoist-at hoist843 place843 )
    ( available hoist843 )
    ( hoist-at hoist618 place618 )
    ( available hoist618 )
    ( hoist-at hoist541 place541 )
    ( available hoist541 )
    ( hoist-at hoist11 place11 )
    ( available hoist11 )
    ( hoist-at hoist784 place784 )
    ( available hoist784 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet343 place487 )
    ( surface-at crate343 place487 )
    ( on crate343 pallet343 )
    ( is-crate crate343 )
    ( clear crate343 )
    ( surface-at pallet591 place784 )
    ( surface-at crate591 place784 )
    ( on crate591 pallet591 )
    ( is-crate crate591 )
    ( clear crate591 )
    ( surface-at pallet458 place707 )
    ( surface-at crate458 place707 )
    ( on crate458 pallet458 )
    ( is-crate crate458 )
    ( clear crate458 )
    ( surface-at pallet654 place618 )
    ( surface-at crate654 place618 )
    ( on crate654 pallet654 )
    ( is-crate crate654 )
    ( clear crate654 )
    ( surface-at pallet853 place637 )
    ( surface-at crate853 place637 )
    ( on crate853 pallet853 )
    ( is-crate crate853 )
    ( clear crate853 )
    ( surface-at pallet989 place727 )
    ( surface-at crate989 place727 )
    ( on crate989 pallet989 )
    ( is-crate crate989 )
    ( clear crate989 )
    ( surface-at pallet269 place541 )
    ( surface-at crate269 place541 )
    ( on crate269 pallet269 )
    ( is-crate crate269 )
    ( clear crate269 )
    ( surface-at pallet277 place152 )
    ( surface-at crate277 place152 )
    ( on crate277 pallet277 )
    ( is-crate crate277 )
    ( clear crate277 )
    ( surface-at pallet89 place152 )
    ( surface-at crate89 place152 )
    ( on crate89 pallet89 )
    ( is-crate crate89 )
    ( clear crate89 )
    ( surface-at pallet911 place867 )
    ( surface-at crate911 place867 )
    ( on crate911 pallet911 )
    ( is-crate crate911 )
    ( clear crate911 )
    ( surface-at pallet132 place12 )
    ( surface-at crate132 place12 )
    ( on crate132 pallet132 )
    ( is-crate crate132 )
    ( clear crate132 )
    ( surface-at pallet120 place957 )
    ( surface-at crate120 place957 )
    ( on crate120 pallet120 )
    ( is-crate crate120 )
    ( clear crate120 )
    ( surface-at pallet16 place152 )
    ( surface-at crate16 place152 )
    ( on crate16 pallet16 )
    ( is-crate crate16 )
    ( clear crate16 )
    ( surface-at pallet130 place784 )
    ( surface-at crate130 place784 )
    ( on crate130 pallet130 )
    ( is-crate crate130 )
    ( clear crate130 )
  )
  ( :goal
    ( and
    )
  )
)
