( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place203 - place
    hoist203 - hoist
    place882 - place
    hoist882 - hoist
    place239 - place
    hoist239 - hoist
    place159 - place
    hoist159 - hoist
    place848 - place
    hoist848 - hoist
    place505 - place
    hoist505 - hoist
    place947 - place
    hoist947 - hoist
    place0 - place
    hoist0 - hoist
    crate623 - surface
    pallet623 - surface
    crate559 - surface
    pallet559 - surface
    crate70 - surface
    pallet70 - surface
    crate936 - surface
    pallet936 - surface
    crate256 - surface
    pallet256 - surface
    crate807 - surface
    pallet807 - surface
    crate102 - surface
    pallet102 - surface
    crate675 - surface
    pallet675 - surface
    crate726 - surface
    pallet726 - surface
    crate692 - surface
    pallet692 - surface
    crate574 - surface
    pallet574 - surface
    crate644 - surface
    pallet644 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist203 place203 )
    ( available hoist203 )
    ( hoist-at hoist882 place882 )
    ( available hoist882 )
    ( hoist-at hoist239 place239 )
    ( available hoist239 )
    ( hoist-at hoist159 place159 )
    ( available hoist159 )
    ( hoist-at hoist848 place848 )
    ( available hoist848 )
    ( hoist-at hoist505 place505 )
    ( available hoist505 )
    ( hoist-at hoist947 place947 )
    ( available hoist947 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet623 place203 )
    ( surface-at crate623 place203 )
    ( on crate623 pallet623 )
    ( is-crate crate623 )
    ( clear crate623 )
    ( surface-at pallet559 place159 )
    ( surface-at crate559 place159 )
    ( on crate559 pallet559 )
    ( is-crate crate559 )
    ( clear crate559 )
    ( surface-at pallet70 place239 )
    ( surface-at crate70 place239 )
    ( on crate70 pallet70 )
    ( is-crate crate70 )
    ( clear crate70 )
    ( surface-at pallet936 place848 )
    ( surface-at crate936 place848 )
    ( on crate936 pallet936 )
    ( is-crate crate936 )
    ( clear crate936 )
    ( surface-at pallet256 place505 )
    ( surface-at crate256 place505 )
    ( on crate256 pallet256 )
    ( is-crate crate256 )
    ( clear crate256 )
    ( surface-at pallet807 place505 )
    ( surface-at crate807 place505 )
    ( on crate807 pallet807 )
    ( is-crate crate807 )
    ( clear crate807 )
    ( surface-at pallet102 place848 )
    ( surface-at crate102 place848 )
    ( on crate102 pallet102 )
    ( is-crate crate102 )
    ( clear crate102 )
    ( surface-at pallet675 place203 )
    ( surface-at crate675 place203 )
    ( on crate675 pallet675 )
    ( is-crate crate675 )
    ( clear crate675 )
    ( surface-at pallet726 place505 )
    ( surface-at crate726 place505 )
    ( on crate726 pallet726 )
    ( is-crate crate726 )
    ( clear crate726 )
    ( surface-at pallet692 place947 )
    ( surface-at crate692 place947 )
    ( on crate692 pallet692 )
    ( is-crate crate692 )
    ( clear crate692 )
    ( surface-at pallet574 place239 )
    ( surface-at crate574 place239 )
    ( on crate574 pallet574 )
    ( is-crate crate574 )
    ( clear crate574 )
    ( surface-at pallet644 place848 )
    ( surface-at crate644 place848 )
    ( on crate644 pallet644 )
    ( is-crate crate644 )
    ( clear crate644 )
  )
  ( :goal
    ( and
    )
  )
)
