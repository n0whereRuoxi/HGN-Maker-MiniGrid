( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place250 - place
    hoist250 - hoist
    place782 - place
    hoist782 - hoist
    place615 - place
    hoist615 - hoist
    place483 - place
    hoist483 - hoist
    place57 - place
    hoist57 - hoist
    place398 - place
    hoist398 - hoist
    place472 - place
    hoist472 - hoist
    place771 - place
    hoist771 - hoist
    place934 - place
    hoist934 - hoist
    place267 - place
    hoist267 - hoist
    place0 - place
    hoist0 - hoist
    crate318 - surface
    pallet318 - surface
    crate320 - surface
    pallet320 - surface
    crate488 - surface
    pallet488 - surface
    crate840 - surface
    pallet840 - surface
    crate35 - surface
    pallet35 - surface
    crate763 - surface
    pallet763 - surface
    crate712 - surface
    pallet712 - surface
    crate195 - surface
    pallet195 - surface
    crate48 - surface
    pallet48 - surface
    crate134 - surface
    pallet134 - surface
    crate943 - surface
    pallet943 - surface
    crate504 - surface
    pallet504 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist250 place250 )
    ( available hoist250 )
    ( hoist-at hoist782 place782 )
    ( available hoist782 )
    ( hoist-at hoist615 place615 )
    ( available hoist615 )
    ( hoist-at hoist483 place483 )
    ( available hoist483 )
    ( hoist-at hoist57 place57 )
    ( available hoist57 )
    ( hoist-at hoist398 place398 )
    ( available hoist398 )
    ( hoist-at hoist472 place472 )
    ( available hoist472 )
    ( hoist-at hoist771 place771 )
    ( available hoist771 )
    ( hoist-at hoist934 place934 )
    ( available hoist934 )
    ( hoist-at hoist267 place267 )
    ( available hoist267 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet318 place771 )
    ( surface-at crate318 place771 )
    ( on crate318 pallet318 )
    ( is-crate crate318 )
    ( clear crate318 )
    ( surface-at pallet320 place771 )
    ( surface-at crate320 place771 )
    ( on crate320 pallet320 )
    ( is-crate crate320 )
    ( clear crate320 )
    ( surface-at pallet488 place472 )
    ( surface-at crate488 place472 )
    ( on crate488 pallet488 )
    ( is-crate crate488 )
    ( clear crate488 )
    ( surface-at pallet840 place615 )
    ( surface-at crate840 place615 )
    ( on crate840 pallet840 )
    ( is-crate crate840 )
    ( clear crate840 )
    ( surface-at pallet35 place250 )
    ( surface-at crate35 place250 )
    ( on crate35 pallet35 )
    ( is-crate crate35 )
    ( clear crate35 )
    ( surface-at pallet763 place934 )
    ( surface-at crate763 place934 )
    ( on crate763 pallet763 )
    ( is-crate crate763 )
    ( clear crate763 )
    ( surface-at pallet712 place250 )
    ( surface-at crate712 place250 )
    ( on crate712 pallet712 )
    ( is-crate crate712 )
    ( clear crate712 )
    ( surface-at pallet195 place472 )
    ( surface-at crate195 place472 )
    ( on crate195 pallet195 )
    ( is-crate crate195 )
    ( clear crate195 )
    ( surface-at pallet48 place267 )
    ( surface-at crate48 place267 )
    ( on crate48 pallet48 )
    ( is-crate crate48 )
    ( clear crate48 )
    ( surface-at pallet134 place267 )
    ( surface-at crate134 place267 )
    ( on crate134 pallet134 )
    ( is-crate crate134 )
    ( clear crate134 )
    ( surface-at pallet943 place57 )
    ( surface-at crate943 place57 )
    ( on crate943 pallet943 )
    ( is-crate crate943 )
    ( clear crate943 )
    ( surface-at pallet504 place615 )
    ( surface-at crate504 place615 )
    ( on crate504 pallet504 )
    ( is-crate crate504 )
    ( clear crate504 )
  )
  ( :goal
    ( and
    )
  )
)
