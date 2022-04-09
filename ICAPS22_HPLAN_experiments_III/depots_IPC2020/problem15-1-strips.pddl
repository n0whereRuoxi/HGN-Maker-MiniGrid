( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place124 - place
    hoist124 - hoist
    place121 - place
    hoist121 - hoist
    place323 - place
    hoist323 - hoist
    place783 - place
    hoist783 - hoist
    place418 - place
    hoist418 - hoist
    place311 - place
    hoist311 - hoist
    place945 - place
    hoist945 - hoist
    place778 - place
    hoist778 - hoist
    place305 - place
    hoist305 - hoist
    place953 - place
    hoist953 - hoist
    place501 - place
    hoist501 - hoist
    place281 - place
    hoist281 - hoist
    place0 - place
    hoist0 - hoist
    crate372 - surface
    pallet372 - surface
    crate503 - surface
    pallet503 - surface
    crate461 - surface
    pallet461 - surface
    crate782 - surface
    pallet782 - surface
    crate241 - surface
    pallet241 - surface
    crate285 - surface
    pallet285 - surface
    crate572 - surface
    pallet572 - surface
    crate580 - surface
    pallet580 - surface
    crate571 - surface
    pallet571 - surface
    crate961 - surface
    pallet961 - surface
    crate641 - surface
    pallet641 - surface
    crate380 - surface
    pallet380 - surface
    crate332 - surface
    pallet332 - surface
    crate914 - surface
    pallet914 - surface
    crate240 - surface
    pallet240 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist124 place124 )
    ( available hoist124 )
    ( hoist-at hoist121 place121 )
    ( available hoist121 )
    ( hoist-at hoist323 place323 )
    ( available hoist323 )
    ( hoist-at hoist783 place783 )
    ( available hoist783 )
    ( hoist-at hoist418 place418 )
    ( available hoist418 )
    ( hoist-at hoist311 place311 )
    ( available hoist311 )
    ( hoist-at hoist945 place945 )
    ( available hoist945 )
    ( hoist-at hoist778 place778 )
    ( available hoist778 )
    ( hoist-at hoist305 place305 )
    ( available hoist305 )
    ( hoist-at hoist953 place953 )
    ( available hoist953 )
    ( hoist-at hoist501 place501 )
    ( available hoist501 )
    ( hoist-at hoist281 place281 )
    ( available hoist281 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet372 place778 )
    ( surface-at crate372 place778 )
    ( on crate372 pallet372 )
    ( is-crate crate372 )
    ( clear crate372 )
    ( surface-at pallet503 place311 )
    ( surface-at crate503 place311 )
    ( on crate503 pallet503 )
    ( is-crate crate503 )
    ( clear crate503 )
    ( surface-at pallet461 place418 )
    ( surface-at crate461 place418 )
    ( on crate461 pallet461 )
    ( is-crate crate461 )
    ( clear crate461 )
    ( surface-at pallet782 place281 )
    ( surface-at crate782 place281 )
    ( on crate782 pallet782 )
    ( is-crate crate782 )
    ( clear crate782 )
    ( surface-at pallet241 place323 )
    ( surface-at crate241 place323 )
    ( on crate241 pallet241 )
    ( is-crate crate241 )
    ( clear crate241 )
    ( surface-at pallet285 place778 )
    ( surface-at crate285 place778 )
    ( on crate285 pallet285 )
    ( is-crate crate285 )
    ( clear crate285 )
    ( surface-at pallet572 place783 )
    ( surface-at crate572 place783 )
    ( on crate572 pallet572 )
    ( is-crate crate572 )
    ( clear crate572 )
    ( surface-at pallet580 place778 )
    ( surface-at crate580 place778 )
    ( on crate580 pallet580 )
    ( is-crate crate580 )
    ( clear crate580 )
    ( surface-at pallet571 place783 )
    ( surface-at crate571 place783 )
    ( on crate571 pallet571 )
    ( is-crate crate571 )
    ( clear crate571 )
    ( surface-at pallet961 place418 )
    ( surface-at crate961 place418 )
    ( on crate961 pallet961 )
    ( is-crate crate961 )
    ( clear crate961 )
    ( surface-at pallet641 place783 )
    ( surface-at crate641 place783 )
    ( on crate641 pallet641 )
    ( is-crate crate641 )
    ( clear crate641 )
    ( surface-at pallet380 place783 )
    ( surface-at crate380 place783 )
    ( on crate380 pallet380 )
    ( is-crate crate380 )
    ( clear crate380 )
    ( surface-at pallet332 place124 )
    ( surface-at crate332 place124 )
    ( on crate332 pallet332 )
    ( is-crate crate332 )
    ( clear crate332 )
    ( surface-at pallet914 place418 )
    ( surface-at crate914 place418 )
    ( on crate914 pallet914 )
    ( is-crate crate914 )
    ( clear crate914 )
    ( surface-at pallet240 place311 )
    ( surface-at crate240 place311 )
    ( on crate240 pallet240 )
    ( is-crate crate240 )
    ( clear crate240 )
  )
  ( :goal
    ( and
    )
  )
)
