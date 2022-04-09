( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place339 - place
    hoist339 - hoist
    place992 - place
    hoist992 - hoist
    place592 - place
    hoist592 - hoist
    place549 - place
    hoist549 - hoist
    place223 - place
    hoist223 - hoist
    place295 - place
    hoist295 - hoist
    place954 - place
    hoist954 - hoist
    place964 - place
    hoist964 - hoist
    place89 - place
    hoist89 - hoist
    place154 - place
    hoist154 - hoist
    place555 - place
    hoist555 - hoist
    place73 - place
    hoist73 - hoist
    place233 - place
    hoist233 - hoist
    place816 - place
    hoist816 - hoist
    place381 - place
    hoist381 - hoist
    place836 - place
    hoist836 - hoist
    place850 - place
    hoist850 - hoist
    place0 - place
    hoist0 - hoist
    crate487 - surface
    pallet487 - surface
    crate753 - surface
    pallet753 - surface
    crate530 - surface
    pallet530 - surface
    crate337 - surface
    pallet337 - surface
    crate284 - surface
    pallet284 - surface
    crate908 - surface
    pallet908 - surface
    crate495 - surface
    pallet495 - surface
    crate449 - surface
    pallet449 - surface
    crate172 - surface
    pallet172 - surface
    crate56 - surface
    pallet56 - surface
    crate109 - surface
    pallet109 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist339 place339 )
    ( available hoist339 )
    ( hoist-at hoist992 place992 )
    ( available hoist992 )
    ( hoist-at hoist592 place592 )
    ( available hoist592 )
    ( hoist-at hoist549 place549 )
    ( available hoist549 )
    ( hoist-at hoist223 place223 )
    ( available hoist223 )
    ( hoist-at hoist295 place295 )
    ( available hoist295 )
    ( hoist-at hoist954 place954 )
    ( available hoist954 )
    ( hoist-at hoist964 place964 )
    ( available hoist964 )
    ( hoist-at hoist89 place89 )
    ( available hoist89 )
    ( hoist-at hoist154 place154 )
    ( available hoist154 )
    ( hoist-at hoist555 place555 )
    ( available hoist555 )
    ( hoist-at hoist73 place73 )
    ( available hoist73 )
    ( hoist-at hoist233 place233 )
    ( available hoist233 )
    ( hoist-at hoist816 place816 )
    ( available hoist816 )
    ( hoist-at hoist381 place381 )
    ( available hoist381 )
    ( hoist-at hoist836 place836 )
    ( available hoist836 )
    ( hoist-at hoist850 place850 )
    ( available hoist850 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet487 place992 )
    ( surface-at crate487 place992 )
    ( on crate487 pallet487 )
    ( is-crate crate487 )
    ( clear crate487 )
    ( surface-at pallet753 place549 )
    ( surface-at crate753 place549 )
    ( on crate753 pallet753 )
    ( is-crate crate753 )
    ( clear crate753 )
    ( surface-at pallet530 place223 )
    ( surface-at crate530 place223 )
    ( on crate530 pallet530 )
    ( is-crate crate530 )
    ( clear crate530 )
    ( surface-at pallet337 place89 )
    ( surface-at crate337 place89 )
    ( on crate337 pallet337 )
    ( is-crate crate337 )
    ( clear crate337 )
    ( surface-at pallet284 place992 )
    ( surface-at crate284 place992 )
    ( on crate284 pallet284 )
    ( is-crate crate284 )
    ( clear crate284 )
    ( surface-at pallet908 place816 )
    ( surface-at crate908 place816 )
    ( on crate908 pallet908 )
    ( is-crate crate908 )
    ( clear crate908 )
    ( surface-at pallet495 place233 )
    ( surface-at crate495 place233 )
    ( on crate495 pallet495 )
    ( is-crate crate495 )
    ( clear crate495 )
    ( surface-at pallet449 place295 )
    ( surface-at crate449 place295 )
    ( on crate449 pallet449 )
    ( is-crate crate449 )
    ( clear crate449 )
    ( surface-at pallet172 place555 )
    ( surface-at crate172 place555 )
    ( on crate172 pallet172 )
    ( is-crate crate172 )
    ( clear crate172 )
    ( surface-at pallet56 place992 )
    ( surface-at crate56 place992 )
    ( on crate56 pallet56 )
    ( is-crate crate56 )
    ( clear crate56 )
    ( surface-at pallet109 place592 )
    ( surface-at crate109 place592 )
    ( on crate109 pallet109 )
    ( is-crate crate109 )
    ( clear crate109 )
  )
  ( :goal
    ( and
    )
  )
)
