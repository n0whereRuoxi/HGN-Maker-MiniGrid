( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place609 - place
    hoist609 - hoist
    place164 - place
    hoist164 - hoist
    place55 - place
    hoist55 - hoist
    place729 - place
    hoist729 - hoist
    place908 - place
    hoist908 - hoist
    place891 - place
    hoist891 - hoist
    place848 - place
    hoist848 - hoist
    place218 - place
    hoist218 - hoist
    place343 - place
    hoist343 - hoist
    place665 - place
    hoist665 - hoist
    place431 - place
    hoist431 - hoist
    place992 - place
    hoist992 - hoist
    place330 - place
    hoist330 - hoist
    place34 - place
    hoist34 - hoist
    place635 - place
    hoist635 - hoist
    place18 - place
    hoist18 - hoist
    place434 - place
    hoist434 - hoist
    place720 - place
    hoist720 - hoist
    place799 - place
    hoist799 - hoist
    place971 - place
    hoist971 - hoist
    place827 - place
    hoist827 - hoist
    place427 - place
    hoist427 - hoist
    place707 - place
    hoist707 - hoist
    place646 - place
    hoist646 - hoist
    place30 - place
    hoist30 - hoist
    place686 - place
    hoist686 - hoist
    place516 - place
    hoist516 - hoist
    place679 - place
    hoist679 - hoist
    place0 - place
    hoist0 - hoist
    crate619 - surface
    pallet619 - surface
    crate293 - surface
    pallet293 - surface
    crate870 - surface
    pallet870 - surface
    crate847 - surface
    pallet847 - surface
    crate400 - surface
    pallet400 - surface
    crate948 - surface
    pallet948 - surface
    crate424 - surface
    pallet424 - surface
    crate184 - surface
    pallet184 - surface
    crate318 - surface
    pallet318 - surface
    crate275 - surface
    pallet275 - surface
    crate251 - surface
    pallet251 - surface
    crate326 - surface
    pallet326 - surface
    crate27 - surface
    pallet27 - surface
    crate82 - surface
    pallet82 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist609 place609 )
    ( available hoist609 )
    ( hoist-at hoist164 place164 )
    ( available hoist164 )
    ( hoist-at hoist55 place55 )
    ( available hoist55 )
    ( hoist-at hoist729 place729 )
    ( available hoist729 )
    ( hoist-at hoist908 place908 )
    ( available hoist908 )
    ( hoist-at hoist891 place891 )
    ( available hoist891 )
    ( hoist-at hoist848 place848 )
    ( available hoist848 )
    ( hoist-at hoist218 place218 )
    ( available hoist218 )
    ( hoist-at hoist343 place343 )
    ( available hoist343 )
    ( hoist-at hoist665 place665 )
    ( available hoist665 )
    ( hoist-at hoist431 place431 )
    ( available hoist431 )
    ( hoist-at hoist992 place992 )
    ( available hoist992 )
    ( hoist-at hoist330 place330 )
    ( available hoist330 )
    ( hoist-at hoist34 place34 )
    ( available hoist34 )
    ( hoist-at hoist635 place635 )
    ( available hoist635 )
    ( hoist-at hoist18 place18 )
    ( available hoist18 )
    ( hoist-at hoist434 place434 )
    ( available hoist434 )
    ( hoist-at hoist720 place720 )
    ( available hoist720 )
    ( hoist-at hoist799 place799 )
    ( available hoist799 )
    ( hoist-at hoist971 place971 )
    ( available hoist971 )
    ( hoist-at hoist827 place827 )
    ( available hoist827 )
    ( hoist-at hoist427 place427 )
    ( available hoist427 )
    ( hoist-at hoist707 place707 )
    ( available hoist707 )
    ( hoist-at hoist646 place646 )
    ( available hoist646 )
    ( hoist-at hoist30 place30 )
    ( available hoist30 )
    ( hoist-at hoist686 place686 )
    ( available hoist686 )
    ( hoist-at hoist516 place516 )
    ( available hoist516 )
    ( hoist-at hoist679 place679 )
    ( available hoist679 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet619 place434 )
    ( surface-at crate619 place434 )
    ( on crate619 pallet619 )
    ( is-crate crate619 )
    ( clear crate619 )
    ( surface-at pallet293 place720 )
    ( surface-at crate293 place720 )
    ( on crate293 pallet293 )
    ( is-crate crate293 )
    ( clear crate293 )
    ( surface-at pallet870 place516 )
    ( surface-at crate870 place516 )
    ( on crate870 pallet870 )
    ( is-crate crate870 )
    ( clear crate870 )
    ( surface-at pallet847 place665 )
    ( surface-at crate847 place665 )
    ( on crate847 pallet847 )
    ( is-crate crate847 )
    ( clear crate847 )
    ( surface-at pallet400 place799 )
    ( surface-at crate400 place799 )
    ( on crate400 pallet400 )
    ( is-crate crate400 )
    ( clear crate400 )
    ( surface-at pallet948 place55 )
    ( surface-at crate948 place55 )
    ( on crate948 pallet948 )
    ( is-crate crate948 )
    ( clear crate948 )
    ( surface-at pallet424 place665 )
    ( surface-at crate424 place665 )
    ( on crate424 pallet424 )
    ( is-crate crate424 )
    ( clear crate424 )
    ( surface-at pallet184 place679 )
    ( surface-at crate184 place679 )
    ( on crate184 pallet184 )
    ( is-crate crate184 )
    ( clear crate184 )
    ( surface-at pallet318 place635 )
    ( surface-at crate318 place635 )
    ( on crate318 pallet318 )
    ( is-crate crate318 )
    ( clear crate318 )
    ( surface-at pallet275 place665 )
    ( surface-at crate275 place665 )
    ( on crate275 pallet275 )
    ( is-crate crate275 )
    ( clear crate275 )
    ( surface-at pallet251 place635 )
    ( surface-at crate251 place635 )
    ( on crate251 pallet251 )
    ( is-crate crate251 )
    ( clear crate251 )
    ( surface-at pallet326 place343 )
    ( surface-at crate326 place343 )
    ( on crate326 pallet326 )
    ( is-crate crate326 )
    ( clear crate326 )
    ( surface-at pallet27 place992 )
    ( surface-at crate27 place992 )
    ( on crate27 pallet27 )
    ( is-crate crate27 )
    ( clear crate27 )
    ( surface-at pallet82 place665 )
    ( surface-at crate82 place665 )
    ( on crate82 pallet82 )
    ( is-crate crate82 )
    ( clear crate82 )
  )
  ( :tasks
    ( Make-14Crate pallet0 crate619 crate293 crate870 crate847 crate400 crate948 crate424 crate184 crate318 crate275 crate251 crate326 crate27 crate82 )
  )
)
