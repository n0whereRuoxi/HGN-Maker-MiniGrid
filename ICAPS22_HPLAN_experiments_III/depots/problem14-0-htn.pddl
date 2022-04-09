( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place304 - place
    hoist304 - hoist
    place485 - place
    hoist485 - hoist
    place111 - place
    hoist111 - hoist
    place39 - place
    hoist39 - hoist
    place998 - place
    hoist998 - hoist
    place196 - place
    hoist196 - hoist
    place352 - place
    hoist352 - hoist
    place50 - place
    hoist50 - hoist
    place915 - place
    hoist915 - hoist
    place80 - place
    hoist80 - hoist
    place411 - place
    hoist411 - hoist
    place922 - place
    hoist922 - hoist
    place392 - place
    hoist392 - hoist
    place346 - place
    hoist346 - hoist
    place73 - place
    hoist73 - hoist
    place0 - place
    hoist0 - hoist
    crate28 - surface
    pallet28 - surface
    crate706 - surface
    pallet706 - surface
    crate74 - surface
    pallet74 - surface
    crate140 - surface
    pallet140 - surface
    crate900 - surface
    pallet900 - surface
    crate533 - surface
    pallet533 - surface
    crate72 - surface
    pallet72 - surface
    crate192 - surface
    pallet192 - surface
    crate413 - surface
    pallet413 - surface
    crate854 - surface
    pallet854 - surface
    crate89 - surface
    pallet89 - surface
    crate847 - surface
    pallet847 - surface
    crate785 - surface
    pallet785 - surface
    crate191 - surface
    pallet191 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist304 place304 )
    ( available hoist304 )
    ( hoist-at hoist485 place485 )
    ( available hoist485 )
    ( hoist-at hoist111 place111 )
    ( available hoist111 )
    ( hoist-at hoist39 place39 )
    ( available hoist39 )
    ( hoist-at hoist998 place998 )
    ( available hoist998 )
    ( hoist-at hoist196 place196 )
    ( available hoist196 )
    ( hoist-at hoist352 place352 )
    ( available hoist352 )
    ( hoist-at hoist50 place50 )
    ( available hoist50 )
    ( hoist-at hoist915 place915 )
    ( available hoist915 )
    ( hoist-at hoist80 place80 )
    ( available hoist80 )
    ( hoist-at hoist411 place411 )
    ( available hoist411 )
    ( hoist-at hoist922 place922 )
    ( available hoist922 )
    ( hoist-at hoist392 place392 )
    ( available hoist392 )
    ( hoist-at hoist346 place346 )
    ( available hoist346 )
    ( hoist-at hoist73 place73 )
    ( available hoist73 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet28 place485 )
    ( surface-at crate28 place485 )
    ( on crate28 pallet28 )
    ( is-crate crate28 )
    ( clear crate28 )
    ( surface-at pallet706 place346 )
    ( surface-at crate706 place346 )
    ( on crate706 pallet706 )
    ( is-crate crate706 )
    ( clear crate706 )
    ( surface-at pallet74 place196 )
    ( surface-at crate74 place196 )
    ( on crate74 pallet74 )
    ( is-crate crate74 )
    ( clear crate74 )
    ( surface-at pallet140 place915 )
    ( surface-at crate140 place915 )
    ( on crate140 pallet140 )
    ( is-crate crate140 )
    ( clear crate140 )
    ( surface-at pallet900 place304 )
    ( surface-at crate900 place304 )
    ( on crate900 pallet900 )
    ( is-crate crate900 )
    ( clear crate900 )
    ( surface-at pallet533 place111 )
    ( surface-at crate533 place111 )
    ( on crate533 pallet533 )
    ( is-crate crate533 )
    ( clear crate533 )
    ( surface-at pallet72 place80 )
    ( surface-at crate72 place80 )
    ( on crate72 pallet72 )
    ( is-crate crate72 )
    ( clear crate72 )
    ( surface-at pallet192 place411 )
    ( surface-at crate192 place411 )
    ( on crate192 pallet192 )
    ( is-crate crate192 )
    ( clear crate192 )
    ( surface-at pallet413 place50 )
    ( surface-at crate413 place50 )
    ( on crate413 pallet413 )
    ( is-crate crate413 )
    ( clear crate413 )
    ( surface-at pallet854 place50 )
    ( surface-at crate854 place50 )
    ( on crate854 pallet854 )
    ( is-crate crate854 )
    ( clear crate854 )
    ( surface-at pallet89 place998 )
    ( surface-at crate89 place998 )
    ( on crate89 pallet89 )
    ( is-crate crate89 )
    ( clear crate89 )
    ( surface-at pallet847 place998 )
    ( surface-at crate847 place998 )
    ( on crate847 pallet847 )
    ( is-crate crate847 )
    ( clear crate847 )
    ( surface-at pallet785 place922 )
    ( surface-at crate785 place922 )
    ( on crate785 pallet785 )
    ( is-crate crate785 )
    ( clear crate785 )
    ( surface-at pallet191 place485 )
    ( surface-at crate191 place485 )
    ( on crate191 pallet191 )
    ( is-crate crate191 )
    ( clear crate191 )
  )
  ( :tasks
    ( Make-14Crate crate28 crate706 crate74 crate140 crate900 crate533 crate72 crate192 crate413 crate854 crate89 crate847 crate785 crate191 l000 )
  )
)
