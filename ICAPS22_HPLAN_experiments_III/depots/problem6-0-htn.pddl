( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place979 - place
    hoist979 - hoist
    place19 - place
    hoist19 - hoist
    place195 - place
    hoist195 - hoist
    place293 - place
    hoist293 - hoist
    place390 - place
    hoist390 - hoist
    place479 - place
    hoist479 - hoist
    place815 - place
    hoist815 - hoist
    place763 - place
    hoist763 - hoist
    place971 - place
    hoist971 - hoist
    place487 - place
    hoist487 - hoist
    place2 - place
    hoist2 - hoist
    place0 - place
    hoist0 - hoist
    crate407 - surface
    pallet407 - surface
    crate466 - surface
    pallet466 - surface
    crate601 - surface
    pallet601 - surface
    crate911 - surface
    pallet911 - surface
    crate700 - surface
    pallet700 - surface
    crate359 - surface
    pallet359 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist979 place979 )
    ( available hoist979 )
    ( hoist-at hoist19 place19 )
    ( available hoist19 )
    ( hoist-at hoist195 place195 )
    ( available hoist195 )
    ( hoist-at hoist293 place293 )
    ( available hoist293 )
    ( hoist-at hoist390 place390 )
    ( available hoist390 )
    ( hoist-at hoist479 place479 )
    ( available hoist479 )
    ( hoist-at hoist815 place815 )
    ( available hoist815 )
    ( hoist-at hoist763 place763 )
    ( available hoist763 )
    ( hoist-at hoist971 place971 )
    ( available hoist971 )
    ( hoist-at hoist487 place487 )
    ( available hoist487 )
    ( hoist-at hoist2 place2 )
    ( available hoist2 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet407 place971 )
    ( surface-at crate407 place971 )
    ( on crate407 pallet407 )
    ( is-crate crate407 )
    ( clear crate407 )
    ( surface-at pallet466 place390 )
    ( surface-at crate466 place390 )
    ( on crate466 pallet466 )
    ( is-crate crate466 )
    ( clear crate466 )
    ( surface-at pallet601 place479 )
    ( surface-at crate601 place479 )
    ( on crate601 pallet601 )
    ( is-crate crate601 )
    ( clear crate601 )
    ( surface-at pallet911 place2 )
    ( surface-at crate911 place2 )
    ( on crate911 pallet911 )
    ( is-crate crate911 )
    ( clear crate911 )
    ( surface-at pallet700 place2 )
    ( surface-at crate700 place2 )
    ( on crate700 pallet700 )
    ( is-crate crate700 )
    ( clear crate700 )
    ( surface-at pallet359 place19 )
    ( surface-at crate359 place19 )
    ( on crate359 pallet359 )
    ( is-crate crate359 )
    ( clear crate359 )
  )
  ( :tasks
    ( Make-6Crate crate407 crate466 crate601 crate911 crate700 crate359 l000 )
  )
)
