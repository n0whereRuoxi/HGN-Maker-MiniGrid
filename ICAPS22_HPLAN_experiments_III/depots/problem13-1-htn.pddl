( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place79 - place
    hoist79 - hoist
    place263 - place
    hoist263 - hoist
    place612 - place
    hoist612 - hoist
    place554 - place
    hoist554 - hoist
    place52 - place
    hoist52 - hoist
    place130 - place
    hoist130 - hoist
    place122 - place
    hoist122 - hoist
    place458 - place
    hoist458 - hoist
    place0 - place
    hoist0 - hoist
    crate561 - surface
    pallet561 - surface
    crate176 - surface
    pallet176 - surface
    crate851 - surface
    pallet851 - surface
    crate329 - surface
    pallet329 - surface
    crate902 - surface
    pallet902 - surface
    crate623 - surface
    pallet623 - surface
    crate177 - surface
    pallet177 - surface
    crate805 - surface
    pallet805 - surface
    crate320 - surface
    pallet320 - surface
    crate24 - surface
    pallet24 - surface
    crate449 - surface
    pallet449 - surface
    crate547 - surface
    pallet547 - surface
    crate665 - surface
    pallet665 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist79 place79 )
    ( available hoist79 )
    ( hoist-at hoist263 place263 )
    ( available hoist263 )
    ( hoist-at hoist612 place612 )
    ( available hoist612 )
    ( hoist-at hoist554 place554 )
    ( available hoist554 )
    ( hoist-at hoist52 place52 )
    ( available hoist52 )
    ( hoist-at hoist130 place130 )
    ( available hoist130 )
    ( hoist-at hoist122 place122 )
    ( available hoist122 )
    ( hoist-at hoist458 place458 )
    ( available hoist458 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet561 place458 )
    ( surface-at crate561 place458 )
    ( on crate561 pallet561 )
    ( is-crate crate561 )
    ( clear crate561 )
    ( surface-at pallet176 place458 )
    ( surface-at crate176 place458 )
    ( on crate176 pallet176 )
    ( is-crate crate176 )
    ( clear crate176 )
    ( surface-at pallet851 place122 )
    ( surface-at crate851 place122 )
    ( on crate851 pallet851 )
    ( is-crate crate851 )
    ( clear crate851 )
    ( surface-at pallet329 place130 )
    ( surface-at crate329 place130 )
    ( on crate329 pallet329 )
    ( is-crate crate329 )
    ( clear crate329 )
    ( surface-at pallet902 place52 )
    ( surface-at crate902 place52 )
    ( on crate902 pallet902 )
    ( is-crate crate902 )
    ( clear crate902 )
    ( surface-at pallet623 place79 )
    ( surface-at crate623 place79 )
    ( on crate623 pallet623 )
    ( is-crate crate623 )
    ( clear crate623 )
    ( surface-at pallet177 place554 )
    ( surface-at crate177 place554 )
    ( on crate177 pallet177 )
    ( is-crate crate177 )
    ( clear crate177 )
    ( surface-at pallet805 place612 )
    ( surface-at crate805 place612 )
    ( on crate805 pallet805 )
    ( is-crate crate805 )
    ( clear crate805 )
    ( surface-at pallet320 place52 )
    ( surface-at crate320 place52 )
    ( on crate320 pallet320 )
    ( is-crate crate320 )
    ( clear crate320 )
    ( surface-at pallet24 place263 )
    ( surface-at crate24 place263 )
    ( on crate24 pallet24 )
    ( is-crate crate24 )
    ( clear crate24 )
    ( surface-at pallet449 place79 )
    ( surface-at crate449 place79 )
    ( on crate449 pallet449 )
    ( is-crate crate449 )
    ( clear crate449 )
    ( surface-at pallet547 place263 )
    ( surface-at crate547 place263 )
    ( on crate547 pallet547 )
    ( is-crate crate547 )
    ( clear crate547 )
    ( surface-at pallet665 place458 )
    ( surface-at crate665 place458 )
    ( on crate665 pallet665 )
    ( is-crate crate665 )
    ( clear crate665 )
  )
  ( :tasks
    ( Make-13Crate crate561 crate176 crate851 crate329 crate902 crate623 crate177 crate805 crate320 crate24 crate449 crate547 crate665 l000 )
  )
)
