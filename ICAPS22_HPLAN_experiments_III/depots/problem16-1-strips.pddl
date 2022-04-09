( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place205 - place
    hoist205 - hoist
    place255 - place
    hoist255 - hoist
    place327 - place
    hoist327 - hoist
    place938 - place
    hoist938 - hoist
    place791 - place
    hoist791 - hoist
    place808 - place
    hoist808 - hoist
    place297 - place
    hoist297 - hoist
    place603 - place
    hoist603 - hoist
    place59 - place
    hoist59 - hoist
    place826 - place
    hoist826 - hoist
    place531 - place
    hoist531 - hoist
    place655 - place
    hoist655 - hoist
    place383 - place
    hoist383 - hoist
    place616 - place
    hoist616 - hoist
    place654 - place
    hoist654 - hoist
    place125 - place
    hoist125 - hoist
    place503 - place
    hoist503 - hoist
    place761 - place
    hoist761 - hoist
    place173 - place
    hoist173 - hoist
    place458 - place
    hoist458 - hoist
    place439 - place
    hoist439 - hoist
    place897 - place
    hoist897 - hoist
    place871 - place
    hoist871 - hoist
    place702 - place
    hoist702 - hoist
    place0 - place
    hoist0 - hoist
    crate860 - surface
    pallet860 - surface
    crate125 - surface
    pallet125 - surface
    crate714 - surface
    pallet714 - surface
    crate806 - surface
    pallet806 - surface
    crate663 - surface
    pallet663 - surface
    crate178 - surface
    pallet178 - surface
    crate11 - surface
    pallet11 - surface
    crate848 - surface
    pallet848 - surface
    crate961 - surface
    pallet961 - surface
    crate282 - surface
    pallet282 - surface
    crate226 - surface
    pallet226 - surface
    crate906 - surface
    pallet906 - surface
    crate938 - surface
    pallet938 - surface
    crate798 - surface
    pallet798 - surface
    crate77 - surface
    pallet77 - surface
    crate966 - surface
    pallet966 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist205 place205 )
    ( available hoist205 )
    ( hoist-at hoist255 place255 )
    ( available hoist255 )
    ( hoist-at hoist327 place327 )
    ( available hoist327 )
    ( hoist-at hoist938 place938 )
    ( available hoist938 )
    ( hoist-at hoist791 place791 )
    ( available hoist791 )
    ( hoist-at hoist808 place808 )
    ( available hoist808 )
    ( hoist-at hoist297 place297 )
    ( available hoist297 )
    ( hoist-at hoist603 place603 )
    ( available hoist603 )
    ( hoist-at hoist59 place59 )
    ( available hoist59 )
    ( hoist-at hoist826 place826 )
    ( available hoist826 )
    ( hoist-at hoist531 place531 )
    ( available hoist531 )
    ( hoist-at hoist655 place655 )
    ( available hoist655 )
    ( hoist-at hoist383 place383 )
    ( available hoist383 )
    ( hoist-at hoist616 place616 )
    ( available hoist616 )
    ( hoist-at hoist654 place654 )
    ( available hoist654 )
    ( hoist-at hoist125 place125 )
    ( available hoist125 )
    ( hoist-at hoist503 place503 )
    ( available hoist503 )
    ( hoist-at hoist761 place761 )
    ( available hoist761 )
    ( hoist-at hoist173 place173 )
    ( available hoist173 )
    ( hoist-at hoist458 place458 )
    ( available hoist458 )
    ( hoist-at hoist439 place439 )
    ( available hoist439 )
    ( hoist-at hoist897 place897 )
    ( available hoist897 )
    ( hoist-at hoist871 place871 )
    ( available hoist871 )
    ( hoist-at hoist702 place702 )
    ( available hoist702 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet860 place603 )
    ( surface-at crate860 place603 )
    ( on crate860 pallet860 )
    ( is-crate crate860 )
    ( clear crate860 )
    ( surface-at pallet125 place871 )
    ( surface-at crate125 place871 )
    ( on crate125 pallet125 )
    ( is-crate crate125 )
    ( clear crate125 )
    ( surface-at pallet714 place654 )
    ( surface-at crate714 place654 )
    ( on crate714 pallet714 )
    ( is-crate crate714 )
    ( clear crate714 )
    ( surface-at pallet806 place327 )
    ( surface-at crate806 place327 )
    ( on crate806 pallet806 )
    ( is-crate crate806 )
    ( clear crate806 )
    ( surface-at pallet663 place871 )
    ( surface-at crate663 place871 )
    ( on crate663 pallet663 )
    ( is-crate crate663 )
    ( clear crate663 )
    ( surface-at pallet178 place297 )
    ( surface-at crate178 place297 )
    ( on crate178 pallet178 )
    ( is-crate crate178 )
    ( clear crate178 )
    ( surface-at pallet11 place808 )
    ( surface-at crate11 place808 )
    ( on crate11 pallet11 )
    ( is-crate crate11 )
    ( clear crate11 )
    ( surface-at pallet848 place938 )
    ( surface-at crate848 place938 )
    ( on crate848 pallet848 )
    ( is-crate crate848 )
    ( clear crate848 )
    ( surface-at pallet961 place503 )
    ( surface-at crate961 place503 )
    ( on crate961 pallet961 )
    ( is-crate crate961 )
    ( clear crate961 )
    ( surface-at pallet282 place871 )
    ( surface-at crate282 place871 )
    ( on crate282 pallet282 )
    ( is-crate crate282 )
    ( clear crate282 )
    ( surface-at pallet226 place826 )
    ( surface-at crate226 place826 )
    ( on crate226 pallet226 )
    ( is-crate crate226 )
    ( clear crate226 )
    ( surface-at pallet906 place808 )
    ( surface-at crate906 place808 )
    ( on crate906 pallet906 )
    ( is-crate crate906 )
    ( clear crate906 )
    ( surface-at pallet938 place173 )
    ( surface-at crate938 place173 )
    ( on crate938 pallet938 )
    ( is-crate crate938 )
    ( clear crate938 )
    ( surface-at pallet798 place383 )
    ( surface-at crate798 place383 )
    ( on crate798 pallet798 )
    ( is-crate crate798 )
    ( clear crate798 )
    ( surface-at pallet77 place439 )
    ( surface-at crate77 place439 )
    ( on crate77 pallet77 )
    ( is-crate crate77 )
    ( clear crate77 )
    ( surface-at pallet966 place808 )
    ( surface-at crate966 place808 )
    ( on crate966 pallet966 )
    ( is-crate crate966 )
    ( clear crate966 )
  )
  ( :goal
    ( and
    )
  )
)
