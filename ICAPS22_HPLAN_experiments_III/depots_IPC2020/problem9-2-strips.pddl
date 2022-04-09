( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place562 - place
    hoist562 - hoist
    place875 - place
    hoist875 - hoist
    place968 - place
    hoist968 - hoist
    place782 - place
    hoist782 - hoist
    place736 - place
    hoist736 - hoist
    place72 - place
    hoist72 - hoist
    place932 - place
    hoist932 - hoist
    place167 - place
    hoist167 - hoist
    place524 - place
    hoist524 - hoist
    place971 - place
    hoist971 - hoist
    place513 - place
    hoist513 - hoist
    place0 - place
    hoist0 - hoist
    crate579 - surface
    pallet579 - surface
    crate590 - surface
    pallet590 - surface
    crate943 - surface
    pallet943 - surface
    crate108 - surface
    pallet108 - surface
    crate698 - surface
    pallet698 - surface
    crate524 - surface
    pallet524 - surface
    crate469 - surface
    pallet469 - surface
    crate628 - surface
    pallet628 - surface
    crate528 - surface
    pallet528 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist562 place562 )
    ( available hoist562 )
    ( hoist-at hoist875 place875 )
    ( available hoist875 )
    ( hoist-at hoist968 place968 )
    ( available hoist968 )
    ( hoist-at hoist782 place782 )
    ( available hoist782 )
    ( hoist-at hoist736 place736 )
    ( available hoist736 )
    ( hoist-at hoist72 place72 )
    ( available hoist72 )
    ( hoist-at hoist932 place932 )
    ( available hoist932 )
    ( hoist-at hoist167 place167 )
    ( available hoist167 )
    ( hoist-at hoist524 place524 )
    ( available hoist524 )
    ( hoist-at hoist971 place971 )
    ( available hoist971 )
    ( hoist-at hoist513 place513 )
    ( available hoist513 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet579 place875 )
    ( surface-at crate579 place875 )
    ( on crate579 pallet579 )
    ( is-crate crate579 )
    ( clear crate579 )
    ( surface-at pallet590 place562 )
    ( surface-at crate590 place562 )
    ( on crate590 pallet590 )
    ( is-crate crate590 )
    ( clear crate590 )
    ( surface-at pallet943 place513 )
    ( surface-at crate943 place513 )
    ( on crate943 pallet943 )
    ( is-crate crate943 )
    ( clear crate943 )
    ( surface-at pallet108 place72 )
    ( surface-at crate108 place72 )
    ( on crate108 pallet108 )
    ( is-crate crate108 )
    ( clear crate108 )
    ( surface-at pallet698 place513 )
    ( surface-at crate698 place513 )
    ( on crate698 pallet698 )
    ( is-crate crate698 )
    ( clear crate698 )
    ( surface-at pallet524 place513 )
    ( surface-at crate524 place513 )
    ( on crate524 pallet524 )
    ( is-crate crate524 )
    ( clear crate524 )
    ( surface-at pallet469 place875 )
    ( surface-at crate469 place875 )
    ( on crate469 pallet469 )
    ( is-crate crate469 )
    ( clear crate469 )
    ( surface-at pallet628 place562 )
    ( surface-at crate628 place562 )
    ( on crate628 pallet628 )
    ( is-crate crate628 )
    ( clear crate628 )
    ( surface-at pallet528 place932 )
    ( surface-at crate528 place932 )
    ( on crate528 pallet528 )
    ( is-crate crate528 )
    ( clear crate528 )
  )
  ( :goal
    ( and
    )
  )
)
