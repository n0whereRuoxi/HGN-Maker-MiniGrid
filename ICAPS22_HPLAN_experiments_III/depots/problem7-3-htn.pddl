( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place198 - place
    hoist198 - hoist
    place983 - place
    hoist983 - hoist
    place674 - place
    hoist674 - hoist
    place102 - place
    hoist102 - hoist
    place708 - place
    hoist708 - hoist
    place143 - place
    hoist143 - hoist
    place816 - place
    hoist816 - hoist
    place894 - place
    hoist894 - hoist
    place936 - place
    hoist936 - hoist
    place743 - place
    hoist743 - hoist
    place0 - place
    hoist0 - hoist
    crate720 - surface
    pallet720 - surface
    crate448 - surface
    pallet448 - surface
    crate887 - surface
    pallet887 - surface
    crate353 - surface
    pallet353 - surface
    crate367 - surface
    pallet367 - surface
    crate265 - surface
    pallet265 - surface
    crate147 - surface
    pallet147 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist198 place198 )
    ( available hoist198 )
    ( hoist-at hoist983 place983 )
    ( available hoist983 )
    ( hoist-at hoist674 place674 )
    ( available hoist674 )
    ( hoist-at hoist102 place102 )
    ( available hoist102 )
    ( hoist-at hoist708 place708 )
    ( available hoist708 )
    ( hoist-at hoist143 place143 )
    ( available hoist143 )
    ( hoist-at hoist816 place816 )
    ( available hoist816 )
    ( hoist-at hoist894 place894 )
    ( available hoist894 )
    ( hoist-at hoist936 place936 )
    ( available hoist936 )
    ( hoist-at hoist743 place743 )
    ( available hoist743 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet720 place816 )
    ( surface-at crate720 place816 )
    ( on crate720 pallet720 )
    ( is-crate crate720 )
    ( clear crate720 )
    ( surface-at pallet448 place708 )
    ( surface-at crate448 place708 )
    ( on crate448 pallet448 )
    ( is-crate crate448 )
    ( clear crate448 )
    ( surface-at pallet887 place743 )
    ( surface-at crate887 place743 )
    ( on crate887 pallet887 )
    ( is-crate crate887 )
    ( clear crate887 )
    ( surface-at pallet353 place816 )
    ( surface-at crate353 place816 )
    ( on crate353 pallet353 )
    ( is-crate crate353 )
    ( clear crate353 )
    ( surface-at pallet367 place143 )
    ( surface-at crate367 place143 )
    ( on crate367 pallet367 )
    ( is-crate crate367 )
    ( clear crate367 )
    ( surface-at pallet265 place198 )
    ( surface-at crate265 place198 )
    ( on crate265 pallet265 )
    ( is-crate crate265 )
    ( clear crate265 )
    ( surface-at pallet147 place936 )
    ( surface-at crate147 place936 )
    ( on crate147 pallet147 )
    ( is-crate crate147 )
    ( clear crate147 )
  )
  ( :tasks
    ( Make-7Crate crate720 crate448 crate887 crate353 crate367 crate265 crate147 l000 )
  )
)
