( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    place726 - place
    hoist726 - hoist
    place226 - place
    hoist226 - hoist
    place880 - place
    hoist880 - hoist
    place513 - place
    hoist513 - hoist
    place66 - place
    hoist66 - hoist
    place752 - place
    hoist752 - hoist
    place593 - place
    hoist593 - hoist
    place0 - place
    hoist0 - hoist
    crate530 - surface
    pallet530 - surface
    crate829 - surface
    pallet829 - surface
    crate448 - surface
    pallet448 - surface
    crate440 - surface
    pallet440 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist726 place726 )
    ( available hoist726 )
    ( hoist-at hoist226 place226 )
    ( available hoist226 )
    ( hoist-at hoist880 place880 )
    ( available hoist880 )
    ( hoist-at hoist513 place513 )
    ( available hoist513 )
    ( hoist-at hoist66 place66 )
    ( available hoist66 )
    ( hoist-at hoist752 place752 )
    ( available hoist752 )
    ( hoist-at hoist593 place593 )
    ( available hoist593 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet530 place880 )
    ( surface-at crate530 place880 )
    ( on crate530 pallet530 )
    ( is-crate crate530 )
    ( clear crate530 )
    ( surface-at pallet829 place880 )
    ( surface-at crate829 place880 )
    ( on crate829 pallet829 )
    ( is-crate crate829 )
    ( clear crate829 )
    ( surface-at pallet448 place226 )
    ( surface-at crate448 place226 )
    ( on crate448 pallet448 )
    ( is-crate crate448 )
    ( clear crate448 )
    ( surface-at pallet440 place226 )
    ( surface-at crate440 place226 )
    ( on crate440 pallet440 )
    ( is-crate crate440 )
    ( clear crate440 )
  )
  ( :tasks
    ( Make-4Crate crate530 crate829 crate448 crate440 l000 )
  )
)
