( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place814 - place
    hoist814 - hoist
    place181 - place
    hoist181 - hoist
    place297 - place
    hoist297 - hoist
    place324 - place
    hoist324 - hoist
    place356 - place
    hoist356 - hoist
    place267 - place
    hoist267 - hoist
    place771 - place
    hoist771 - hoist
    place740 - place
    hoist740 - hoist
    place185 - place
    hoist185 - hoist
    place0 - place
    hoist0 - hoist
    crate433 - surface
    pallet433 - surface
    crate472 - surface
    pallet472 - surface
    crate129 - surface
    pallet129 - surface
    crate467 - surface
    pallet467 - surface
    crate365 - surface
    pallet365 - surface
    crate478 - surface
    pallet478 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist814 place814 )
    ( available hoist814 )
    ( hoist-at hoist181 place181 )
    ( available hoist181 )
    ( hoist-at hoist297 place297 )
    ( available hoist297 )
    ( hoist-at hoist324 place324 )
    ( available hoist324 )
    ( hoist-at hoist356 place356 )
    ( available hoist356 )
    ( hoist-at hoist267 place267 )
    ( available hoist267 )
    ( hoist-at hoist771 place771 )
    ( available hoist771 )
    ( hoist-at hoist740 place740 )
    ( available hoist740 )
    ( hoist-at hoist185 place185 )
    ( available hoist185 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet433 place740 )
    ( surface-at crate433 place740 )
    ( on crate433 pallet433 )
    ( is-crate crate433 )
    ( clear crate433 )
    ( surface-at pallet472 place356 )
    ( surface-at crate472 place356 )
    ( on crate472 pallet472 )
    ( is-crate crate472 )
    ( clear crate472 )
    ( surface-at pallet129 place771 )
    ( surface-at crate129 place771 )
    ( on crate129 pallet129 )
    ( is-crate crate129 )
    ( clear crate129 )
    ( surface-at pallet467 place267 )
    ( surface-at crate467 place267 )
    ( on crate467 pallet467 )
    ( is-crate crate467 )
    ( clear crate467 )
    ( surface-at pallet365 place771 )
    ( surface-at crate365 place771 )
    ( on crate365 pallet365 )
    ( is-crate crate365 )
    ( clear crate365 )
    ( surface-at pallet478 place740 )
    ( surface-at crate478 place740 )
    ( on crate478 pallet478 )
    ( is-crate crate478 )
    ( clear crate478 )
  )
  ( :tasks
    ( Make-6Crate pallet0 crate433 crate472 crate129 crate467 crate365 crate478 )
  )
)
