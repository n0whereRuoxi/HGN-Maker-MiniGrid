( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place452 - place
    hoist452 - hoist
    place43 - place
    hoist43 - hoist
    place378 - place
    hoist378 - hoist
    place365 - place
    hoist365 - hoist
    place522 - place
    hoist522 - hoist
    place603 - place
    hoist603 - hoist
    place74 - place
    hoist74 - hoist
    place113 - place
    hoist113 - hoist
    place65 - place
    hoist65 - hoist
    place678 - place
    hoist678 - hoist
    place933 - place
    hoist933 - hoist
    place669 - place
    hoist669 - hoist
    place128 - place
    hoist128 - hoist
    place657 - place
    hoist657 - hoist
    place942 - place
    hoist942 - hoist
    place357 - place
    hoist357 - hoist
    place778 - place
    hoist778 - hoist
    place172 - place
    hoist172 - hoist
    place703 - place
    hoist703 - hoist
    place0 - place
    hoist0 - hoist
    crate872 - surface
    pallet872 - surface
    crate130 - surface
    pallet130 - surface
    crate819 - surface
    pallet819 - surface
    crate757 - surface
    pallet757 - surface
    crate834 - surface
    pallet834 - surface
    crate6 - surface
    pallet6 - surface
    crate394 - surface
    pallet394 - surface
    crate537 - surface
    pallet537 - surface
    crate147 - surface
    pallet147 - surface
    crate938 - surface
    pallet938 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist452 place452 )
    ( available hoist452 )
    ( hoist-at hoist43 place43 )
    ( available hoist43 )
    ( hoist-at hoist378 place378 )
    ( available hoist378 )
    ( hoist-at hoist365 place365 )
    ( available hoist365 )
    ( hoist-at hoist522 place522 )
    ( available hoist522 )
    ( hoist-at hoist603 place603 )
    ( available hoist603 )
    ( hoist-at hoist74 place74 )
    ( available hoist74 )
    ( hoist-at hoist113 place113 )
    ( available hoist113 )
    ( hoist-at hoist65 place65 )
    ( available hoist65 )
    ( hoist-at hoist678 place678 )
    ( available hoist678 )
    ( hoist-at hoist933 place933 )
    ( available hoist933 )
    ( hoist-at hoist669 place669 )
    ( available hoist669 )
    ( hoist-at hoist128 place128 )
    ( available hoist128 )
    ( hoist-at hoist657 place657 )
    ( available hoist657 )
    ( hoist-at hoist942 place942 )
    ( available hoist942 )
    ( hoist-at hoist357 place357 )
    ( available hoist357 )
    ( hoist-at hoist778 place778 )
    ( available hoist778 )
    ( hoist-at hoist172 place172 )
    ( available hoist172 )
    ( hoist-at hoist703 place703 )
    ( available hoist703 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet872 place669 )
    ( surface-at crate872 place669 )
    ( on crate872 pallet872 )
    ( is-crate crate872 )
    ( clear crate872 )
    ( surface-at pallet130 place657 )
    ( surface-at crate130 place657 )
    ( on crate130 pallet130 )
    ( is-crate crate130 )
    ( clear crate130 )
    ( surface-at pallet819 place65 )
    ( surface-at crate819 place65 )
    ( on crate819 pallet819 )
    ( is-crate crate819 )
    ( clear crate819 )
    ( surface-at pallet757 place43 )
    ( surface-at crate757 place43 )
    ( on crate757 pallet757 )
    ( is-crate crate757 )
    ( clear crate757 )
    ( surface-at pallet834 place378 )
    ( surface-at crate834 place378 )
    ( on crate834 pallet834 )
    ( is-crate crate834 )
    ( clear crate834 )
    ( surface-at pallet6 place669 )
    ( surface-at crate6 place669 )
    ( on crate6 pallet6 )
    ( is-crate crate6 )
    ( clear crate6 )
    ( surface-at pallet394 place452 )
    ( surface-at crate394 place452 )
    ( on crate394 pallet394 )
    ( is-crate crate394 )
    ( clear crate394 )
    ( surface-at pallet537 place357 )
    ( surface-at crate537 place357 )
    ( on crate537 pallet537 )
    ( is-crate crate537 )
    ( clear crate537 )
    ( surface-at pallet147 place172 )
    ( surface-at crate147 place172 )
    ( on crate147 pallet147 )
    ( is-crate crate147 )
    ( clear crate147 )
    ( surface-at pallet938 place778 )
    ( surface-at crate938 place778 )
    ( on crate938 pallet938 )
    ( is-crate crate938 )
    ( clear crate938 )
  )
  ( :goal
    ( and
    )
  )
)
