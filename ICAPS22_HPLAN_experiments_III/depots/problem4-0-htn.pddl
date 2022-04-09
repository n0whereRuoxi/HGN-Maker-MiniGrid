( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place673 - place
    hoist673 - hoist
    place382 - place
    hoist382 - hoist
    place767 - place
    hoist767 - hoist
    place553 - place
    hoist553 - hoist
    place843 - place
    hoist843 - hoist
    place687 - place
    hoist687 - hoist
    place957 - place
    hoist957 - hoist
    place274 - place
    hoist274 - hoist
    place0 - place
    hoist0 - hoist
    crate8 - surface
    pallet8 - surface
    crate962 - surface
    pallet962 - surface
    crate963 - surface
    pallet963 - surface
    crate188 - surface
    pallet188 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist673 place673 )
    ( available hoist673 )
    ( hoist-at hoist382 place382 )
    ( available hoist382 )
    ( hoist-at hoist767 place767 )
    ( available hoist767 )
    ( hoist-at hoist553 place553 )
    ( available hoist553 )
    ( hoist-at hoist843 place843 )
    ( available hoist843 )
    ( hoist-at hoist687 place687 )
    ( available hoist687 )
    ( hoist-at hoist957 place957 )
    ( available hoist957 )
    ( hoist-at hoist274 place274 )
    ( available hoist274 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet8 place274 )
    ( surface-at crate8 place274 )
    ( on crate8 pallet8 )
    ( is-crate crate8 )
    ( clear crate8 )
    ( surface-at pallet962 place843 )
    ( surface-at crate962 place843 )
    ( on crate962 pallet962 )
    ( is-crate crate962 )
    ( clear crate962 )
    ( surface-at pallet963 place957 )
    ( surface-at crate963 place957 )
    ( on crate963 pallet963 )
    ( is-crate crate963 )
    ( clear crate963 )
    ( surface-at pallet188 place553 )
    ( surface-at crate188 place553 )
    ( on crate188 pallet188 )
    ( is-crate crate188 )
    ( clear crate188 )
  )
  ( :tasks
    ( Make-4Crate crate8 crate962 crate963 crate188 l000 )
  )
)
