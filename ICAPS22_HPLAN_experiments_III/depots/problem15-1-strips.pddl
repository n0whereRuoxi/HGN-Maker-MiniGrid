( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place763 - place
    hoist763 - hoist
    place420 - place
    hoist420 - hoist
    place880 - place
    hoist880 - hoist
    place209 - place
    hoist209 - hoist
    place942 - place
    hoist942 - hoist
    place606 - place
    hoist606 - hoist
    place709 - place
    hoist709 - hoist
    place308 - place
    hoist308 - hoist
    place810 - place
    hoist810 - hoist
    place490 - place
    hoist490 - hoist
    place266 - place
    hoist266 - hoist
    place239 - place
    hoist239 - hoist
    place978 - place
    hoist978 - hoist
    place954 - place
    hoist954 - hoist
    place257 - place
    hoist257 - hoist
    place474 - place
    hoist474 - hoist
    place860 - place
    hoist860 - hoist
    place639 - place
    hoist639 - hoist
    place309 - place
    hoist309 - hoist
    place191 - place
    hoist191 - hoist
    place962 - place
    hoist962 - hoist
    place350 - place
    hoist350 - hoist
    place0 - place
    hoist0 - hoist
    crate396 - surface
    pallet396 - surface
    crate710 - surface
    pallet710 - surface
    crate102 - surface
    pallet102 - surface
    crate671 - surface
    pallet671 - surface
    crate318 - surface
    pallet318 - surface
    crate382 - surface
    pallet382 - surface
    crate687 - surface
    pallet687 - surface
    crate995 - surface
    pallet995 - surface
    crate934 - surface
    pallet934 - surface
    crate94 - surface
    pallet94 - surface
    crate694 - surface
    pallet694 - surface
    crate853 - surface
    pallet853 - surface
    crate319 - surface
    pallet319 - surface
    crate334 - surface
    pallet334 - surface
    crate551 - surface
    pallet551 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist763 place763 )
    ( available hoist763 )
    ( hoist-at hoist420 place420 )
    ( available hoist420 )
    ( hoist-at hoist880 place880 )
    ( available hoist880 )
    ( hoist-at hoist209 place209 )
    ( available hoist209 )
    ( hoist-at hoist942 place942 )
    ( available hoist942 )
    ( hoist-at hoist606 place606 )
    ( available hoist606 )
    ( hoist-at hoist709 place709 )
    ( available hoist709 )
    ( hoist-at hoist308 place308 )
    ( available hoist308 )
    ( hoist-at hoist810 place810 )
    ( available hoist810 )
    ( hoist-at hoist490 place490 )
    ( available hoist490 )
    ( hoist-at hoist266 place266 )
    ( available hoist266 )
    ( hoist-at hoist239 place239 )
    ( available hoist239 )
    ( hoist-at hoist978 place978 )
    ( available hoist978 )
    ( hoist-at hoist954 place954 )
    ( available hoist954 )
    ( hoist-at hoist257 place257 )
    ( available hoist257 )
    ( hoist-at hoist474 place474 )
    ( available hoist474 )
    ( hoist-at hoist860 place860 )
    ( available hoist860 )
    ( hoist-at hoist639 place639 )
    ( available hoist639 )
    ( hoist-at hoist309 place309 )
    ( available hoist309 )
    ( hoist-at hoist191 place191 )
    ( available hoist191 )
    ( hoist-at hoist962 place962 )
    ( available hoist962 )
    ( hoist-at hoist350 place350 )
    ( available hoist350 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet396 place308 )
    ( surface-at crate396 place308 )
    ( on crate396 pallet396 )
    ( is-crate crate396 )
    ( clear crate396 )
    ( surface-at pallet710 place978 )
    ( surface-at crate710 place978 )
    ( on crate710 pallet710 )
    ( is-crate crate710 )
    ( clear crate710 )
    ( surface-at pallet102 place962 )
    ( surface-at crate102 place962 )
    ( on crate102 pallet102 )
    ( is-crate crate102 )
    ( clear crate102 )
    ( surface-at pallet671 place942 )
    ( surface-at crate671 place942 )
    ( on crate671 pallet671 )
    ( is-crate crate671 )
    ( clear crate671 )
    ( surface-at pallet318 place266 )
    ( surface-at crate318 place266 )
    ( on crate318 pallet318 )
    ( is-crate crate318 )
    ( clear crate318 )
    ( surface-at pallet382 place209 )
    ( surface-at crate382 place209 )
    ( on crate382 pallet382 )
    ( is-crate crate382 )
    ( clear crate382 )
    ( surface-at pallet687 place350 )
    ( surface-at crate687 place350 )
    ( on crate687 pallet687 )
    ( is-crate crate687 )
    ( clear crate687 )
    ( surface-at pallet995 place309 )
    ( surface-at crate995 place309 )
    ( on crate995 pallet995 )
    ( is-crate crate995 )
    ( clear crate995 )
    ( surface-at pallet934 place420 )
    ( surface-at crate934 place420 )
    ( on crate934 pallet934 )
    ( is-crate crate934 )
    ( clear crate934 )
    ( surface-at pallet94 place474 )
    ( surface-at crate94 place474 )
    ( on crate94 pallet94 )
    ( is-crate crate94 )
    ( clear crate94 )
    ( surface-at pallet694 place962 )
    ( surface-at crate694 place962 )
    ( on crate694 pallet694 )
    ( is-crate crate694 )
    ( clear crate694 )
    ( surface-at pallet853 place942 )
    ( surface-at crate853 place942 )
    ( on crate853 pallet853 )
    ( is-crate crate853 )
    ( clear crate853 )
    ( surface-at pallet319 place490 )
    ( surface-at crate319 place490 )
    ( on crate319 pallet319 )
    ( is-crate crate319 )
    ( clear crate319 )
    ( surface-at pallet334 place309 )
    ( surface-at crate334 place309 )
    ( on crate334 pallet334 )
    ( is-crate crate334 )
    ( clear crate334 )
    ( surface-at pallet551 place209 )
    ( surface-at crate551 place209 )
    ( on crate551 pallet551 )
    ( is-crate crate551 )
    ( clear crate551 )
  )
  ( :goal
    ( and
    )
  )
)
