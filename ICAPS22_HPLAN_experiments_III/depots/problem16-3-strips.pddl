( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place783 - place
    hoist783 - hoist
    place366 - place
    hoist366 - hoist
    place307 - place
    hoist307 - hoist
    place607 - place
    hoist607 - hoist
    place514 - place
    hoist514 - hoist
    place204 - place
    hoist204 - hoist
    place312 - place
    hoist312 - hoist
    place712 - place
    hoist712 - hoist
    place444 - place
    hoist444 - hoist
    place461 - place
    hoist461 - hoist
    place499 - place
    hoist499 - hoist
    place778 - place
    hoist778 - hoist
    place76 - place
    hoist76 - hoist
    place867 - place
    hoist867 - hoist
    place301 - place
    hoist301 - hoist
    place648 - place
    hoist648 - hoist
    place516 - place
    hoist516 - hoist
    place834 - place
    hoist834 - hoist
    place945 - place
    hoist945 - hoist
    place887 - place
    hoist887 - hoist
    place205 - place
    hoist205 - hoist
    place164 - place
    hoist164 - hoist
    place991 - place
    hoist991 - hoist
    place528 - place
    hoist528 - hoist
    place157 - place
    hoist157 - hoist
    place791 - place
    hoist791 - hoist
    place25 - place
    hoist25 - hoist
    place527 - place
    hoist527 - hoist
    place0 - place
    hoist0 - hoist
    crate327 - surface
    pallet327 - surface
    crate819 - surface
    pallet819 - surface
    crate261 - surface
    pallet261 - surface
    crate51 - surface
    pallet51 - surface
    crate135 - surface
    pallet135 - surface
    crate441 - surface
    pallet441 - surface
    crate314 - surface
    pallet314 - surface
    crate740 - surface
    pallet740 - surface
    crate470 - surface
    pallet470 - surface
    crate881 - surface
    pallet881 - surface
    crate111 - surface
    pallet111 - surface
    crate981 - surface
    pallet981 - surface
    crate35 - surface
    pallet35 - surface
    crate990 - surface
    pallet990 - surface
    crate642 - surface
    pallet642 - surface
    crate376 - surface
    pallet376 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist783 place783 )
    ( available hoist783 )
    ( hoist-at hoist366 place366 )
    ( available hoist366 )
    ( hoist-at hoist307 place307 )
    ( available hoist307 )
    ( hoist-at hoist607 place607 )
    ( available hoist607 )
    ( hoist-at hoist514 place514 )
    ( available hoist514 )
    ( hoist-at hoist204 place204 )
    ( available hoist204 )
    ( hoist-at hoist312 place312 )
    ( available hoist312 )
    ( hoist-at hoist712 place712 )
    ( available hoist712 )
    ( hoist-at hoist444 place444 )
    ( available hoist444 )
    ( hoist-at hoist461 place461 )
    ( available hoist461 )
    ( hoist-at hoist499 place499 )
    ( available hoist499 )
    ( hoist-at hoist778 place778 )
    ( available hoist778 )
    ( hoist-at hoist76 place76 )
    ( available hoist76 )
    ( hoist-at hoist867 place867 )
    ( available hoist867 )
    ( hoist-at hoist301 place301 )
    ( available hoist301 )
    ( hoist-at hoist648 place648 )
    ( available hoist648 )
    ( hoist-at hoist516 place516 )
    ( available hoist516 )
    ( hoist-at hoist834 place834 )
    ( available hoist834 )
    ( hoist-at hoist945 place945 )
    ( available hoist945 )
    ( hoist-at hoist887 place887 )
    ( available hoist887 )
    ( hoist-at hoist205 place205 )
    ( available hoist205 )
    ( hoist-at hoist164 place164 )
    ( available hoist164 )
    ( hoist-at hoist991 place991 )
    ( available hoist991 )
    ( hoist-at hoist528 place528 )
    ( available hoist528 )
    ( hoist-at hoist157 place157 )
    ( available hoist157 )
    ( hoist-at hoist791 place791 )
    ( available hoist791 )
    ( hoist-at hoist25 place25 )
    ( available hoist25 )
    ( hoist-at hoist527 place527 )
    ( available hoist527 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet327 place783 )
    ( surface-at crate327 place783 )
    ( on crate327 pallet327 )
    ( is-crate crate327 )
    ( clear crate327 )
    ( surface-at pallet819 place205 )
    ( surface-at crate819 place205 )
    ( on crate819 pallet819 )
    ( is-crate crate819 )
    ( clear crate819 )
    ( surface-at pallet261 place527 )
    ( surface-at crate261 place527 )
    ( on crate261 pallet261 )
    ( is-crate crate261 )
    ( clear crate261 )
    ( surface-at pallet51 place514 )
    ( surface-at crate51 place514 )
    ( on crate51 pallet51 )
    ( is-crate crate51 )
    ( clear crate51 )
    ( surface-at pallet135 place867 )
    ( surface-at crate135 place867 )
    ( on crate135 pallet135 )
    ( is-crate crate135 )
    ( clear crate135 )
    ( surface-at pallet441 place887 )
    ( surface-at crate441 place887 )
    ( on crate441 pallet441 )
    ( is-crate crate441 )
    ( clear crate441 )
    ( surface-at pallet314 place499 )
    ( surface-at crate314 place499 )
    ( on crate314 pallet314 )
    ( is-crate crate314 )
    ( clear crate314 )
    ( surface-at pallet740 place205 )
    ( surface-at crate740 place205 )
    ( on crate740 pallet740 )
    ( is-crate crate740 )
    ( clear crate740 )
    ( surface-at pallet470 place527 )
    ( surface-at crate470 place527 )
    ( on crate470 pallet470 )
    ( is-crate crate470 )
    ( clear crate470 )
    ( surface-at pallet881 place528 )
    ( surface-at crate881 place528 )
    ( on crate881 pallet881 )
    ( is-crate crate881 )
    ( clear crate881 )
    ( surface-at pallet111 place204 )
    ( surface-at crate111 place204 )
    ( on crate111 pallet111 )
    ( is-crate crate111 )
    ( clear crate111 )
    ( surface-at pallet981 place712 )
    ( surface-at crate981 place712 )
    ( on crate981 pallet981 )
    ( is-crate crate981 )
    ( clear crate981 )
    ( surface-at pallet35 place301 )
    ( surface-at crate35 place301 )
    ( on crate35 pallet35 )
    ( is-crate crate35 )
    ( clear crate35 )
    ( surface-at pallet990 place205 )
    ( surface-at crate990 place205 )
    ( on crate990 pallet990 )
    ( is-crate crate990 )
    ( clear crate990 )
    ( surface-at pallet642 place607 )
    ( surface-at crate642 place607 )
    ( on crate642 pallet642 )
    ( is-crate crate642 )
    ( clear crate642 )
    ( surface-at pallet376 place712 )
    ( surface-at crate376 place712 )
    ( on crate376 pallet376 )
    ( is-crate crate376 )
    ( clear crate376 )
  )
  ( :goal
    ( and
    )
  )
)
