( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place339 - place
    hoist339 - hoist
    place378 - place
    hoist378 - hoist
    place303 - place
    hoist303 - hoist
    place135 - place
    hoist135 - hoist
    place0 - place
    hoist0 - hoist
    crate687 - surface
    pallet687 - surface
    crate372 - surface
    pallet372 - surface
    crate987 - surface
    pallet987 - surface
    crate657 - surface
    pallet657 - surface
    crate86 - surface
    pallet86 - surface
    crate21 - surface
    pallet21 - surface
    crate503 - surface
    pallet503 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist339 place339 )
    ( available hoist339 )
    ( hoist-at hoist378 place378 )
    ( available hoist378 )
    ( hoist-at hoist303 place303 )
    ( available hoist303 )
    ( hoist-at hoist135 place135 )
    ( available hoist135 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet687 place339 )
    ( surface-at crate687 place339 )
    ( on crate687 pallet687 )
    ( is-crate crate687 )
    ( clear crate687 )
    ( surface-at pallet372 place303 )
    ( surface-at crate372 place303 )
    ( on crate372 pallet372 )
    ( is-crate crate372 )
    ( clear crate372 )
    ( surface-at pallet987 place378 )
    ( surface-at crate987 place378 )
    ( on crate987 pallet987 )
    ( is-crate crate987 )
    ( clear crate987 )
    ( surface-at pallet657 place303 )
    ( surface-at crate657 place303 )
    ( on crate657 pallet657 )
    ( is-crate crate657 )
    ( clear crate657 )
    ( surface-at pallet86 place339 )
    ( surface-at crate86 place339 )
    ( on crate86 pallet86 )
    ( is-crate crate86 )
    ( clear crate86 )
    ( surface-at pallet21 place339 )
    ( surface-at crate21 place339 )
    ( on crate21 pallet21 )
    ( is-crate crate21 )
    ( clear crate21 )
    ( surface-at pallet503 place303 )
    ( surface-at crate503 place303 )
    ( on crate503 pallet503 )
    ( is-crate crate503 )
    ( clear crate503 )
  )
  ( :goal
    ( and
    )
  )
)
