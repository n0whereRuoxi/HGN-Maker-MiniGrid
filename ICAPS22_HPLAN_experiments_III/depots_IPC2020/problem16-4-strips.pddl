( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place756 - place
    hoist756 - hoist
    place613 - place
    hoist613 - hoist
    place81 - place
    hoist81 - hoist
    place373 - place
    hoist373 - hoist
    place84 - place
    hoist84 - hoist
    place132 - place
    hoist132 - hoist
    place286 - place
    hoist286 - hoist
    place298 - place
    hoist298 - hoist
    place791 - place
    hoist791 - hoist
    place0 - place
    hoist0 - hoist
    crate147 - surface
    pallet147 - surface
    crate211 - surface
    pallet211 - surface
    crate655 - surface
    pallet655 - surface
    crate126 - surface
    pallet126 - surface
    crate185 - surface
    pallet185 - surface
    crate375 - surface
    pallet375 - surface
    crate13 - surface
    pallet13 - surface
    crate29 - surface
    pallet29 - surface
    crate279 - surface
    pallet279 - surface
    crate87 - surface
    pallet87 - surface
    crate418 - surface
    pallet418 - surface
    crate709 - surface
    pallet709 - surface
    crate154 - surface
    pallet154 - surface
    crate365 - surface
    pallet365 - surface
    crate139 - surface
    pallet139 - surface
    crate71 - surface
    pallet71 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist756 place756 )
    ( available hoist756 )
    ( hoist-at hoist613 place613 )
    ( available hoist613 )
    ( hoist-at hoist81 place81 )
    ( available hoist81 )
    ( hoist-at hoist373 place373 )
    ( available hoist373 )
    ( hoist-at hoist84 place84 )
    ( available hoist84 )
    ( hoist-at hoist132 place132 )
    ( available hoist132 )
    ( hoist-at hoist286 place286 )
    ( available hoist286 )
    ( hoist-at hoist298 place298 )
    ( available hoist298 )
    ( hoist-at hoist791 place791 )
    ( available hoist791 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet147 place373 )
    ( surface-at crate147 place373 )
    ( on crate147 pallet147 )
    ( is-crate crate147 )
    ( clear crate147 )
    ( surface-at pallet211 place132 )
    ( surface-at crate211 place132 )
    ( on crate211 pallet211 )
    ( is-crate crate211 )
    ( clear crate211 )
    ( surface-at pallet655 place286 )
    ( surface-at crate655 place286 )
    ( on crate655 pallet655 )
    ( is-crate crate655 )
    ( clear crate655 )
    ( surface-at pallet126 place791 )
    ( surface-at crate126 place791 )
    ( on crate126 pallet126 )
    ( is-crate crate126 )
    ( clear crate126 )
    ( surface-at pallet185 place791 )
    ( surface-at crate185 place791 )
    ( on crate185 pallet185 )
    ( is-crate crate185 )
    ( clear crate185 )
    ( surface-at pallet375 place756 )
    ( surface-at crate375 place756 )
    ( on crate375 pallet375 )
    ( is-crate crate375 )
    ( clear crate375 )
    ( surface-at pallet13 place81 )
    ( surface-at crate13 place81 )
    ( on crate13 pallet13 )
    ( is-crate crate13 )
    ( clear crate13 )
    ( surface-at pallet29 place132 )
    ( surface-at crate29 place132 )
    ( on crate29 pallet29 )
    ( is-crate crate29 )
    ( clear crate29 )
    ( surface-at pallet279 place286 )
    ( surface-at crate279 place286 )
    ( on crate279 pallet279 )
    ( is-crate crate279 )
    ( clear crate279 )
    ( surface-at pallet87 place613 )
    ( surface-at crate87 place613 )
    ( on crate87 pallet87 )
    ( is-crate crate87 )
    ( clear crate87 )
    ( surface-at pallet418 place373 )
    ( surface-at crate418 place373 )
    ( on crate418 pallet418 )
    ( is-crate crate418 )
    ( clear crate418 )
    ( surface-at pallet709 place132 )
    ( surface-at crate709 place132 )
    ( on crate709 pallet709 )
    ( is-crate crate709 )
    ( clear crate709 )
    ( surface-at pallet154 place132 )
    ( surface-at crate154 place132 )
    ( on crate154 pallet154 )
    ( is-crate crate154 )
    ( clear crate154 )
    ( surface-at pallet365 place81 )
    ( surface-at crate365 place81 )
    ( on crate365 pallet365 )
    ( is-crate crate365 )
    ( clear crate365 )
    ( surface-at pallet139 place373 )
    ( surface-at crate139 place373 )
    ( on crate139 pallet139 )
    ( is-crate crate139 )
    ( clear crate139 )
    ( surface-at pallet71 place756 )
    ( surface-at crate71 place756 )
    ( on crate71 pallet71 )
    ( is-crate crate71 )
    ( clear crate71 )
  )
  ( :goal
    ( and
    )
  )
)
