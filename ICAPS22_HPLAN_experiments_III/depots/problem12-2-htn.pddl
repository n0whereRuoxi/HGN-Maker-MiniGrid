( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place105 - place
    hoist105 - hoist
    place476 - place
    hoist476 - hoist
    place235 - place
    hoist235 - hoist
    place924 - place
    hoist924 - hoist
    place823 - place
    hoist823 - hoist
    place77 - place
    hoist77 - hoist
    place736 - place
    hoist736 - hoist
    place781 - place
    hoist781 - hoist
    place660 - place
    hoist660 - hoist
    place100 - place
    hoist100 - hoist
    place715 - place
    hoist715 - hoist
    place541 - place
    hoist541 - hoist
    place557 - place
    hoist557 - hoist
    place430 - place
    hoist430 - hoist
    place532 - place
    hoist532 - hoist
    place941 - place
    hoist941 - hoist
    place815 - place
    hoist815 - hoist
    place744 - place
    hoist744 - hoist
    place127 - place
    hoist127 - hoist
    place591 - place
    hoist591 - hoist
    place488 - place
    hoist488 - hoist
    place0 - place
    hoist0 - hoist
    crate922 - surface
    pallet922 - surface
    crate400 - surface
    pallet400 - surface
    crate348 - surface
    pallet348 - surface
    crate557 - surface
    pallet557 - surface
    crate58 - surface
    pallet58 - surface
    crate728 - surface
    pallet728 - surface
    crate944 - surface
    pallet944 - surface
    crate470 - surface
    pallet470 - surface
    crate142 - surface
    pallet142 - surface
    crate428 - surface
    pallet428 - surface
    crate508 - surface
    pallet508 - surface
    crate664 - surface
    pallet664 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist105 place105 )
    ( available hoist105 )
    ( hoist-at hoist476 place476 )
    ( available hoist476 )
    ( hoist-at hoist235 place235 )
    ( available hoist235 )
    ( hoist-at hoist924 place924 )
    ( available hoist924 )
    ( hoist-at hoist823 place823 )
    ( available hoist823 )
    ( hoist-at hoist77 place77 )
    ( available hoist77 )
    ( hoist-at hoist736 place736 )
    ( available hoist736 )
    ( hoist-at hoist781 place781 )
    ( available hoist781 )
    ( hoist-at hoist660 place660 )
    ( available hoist660 )
    ( hoist-at hoist100 place100 )
    ( available hoist100 )
    ( hoist-at hoist715 place715 )
    ( available hoist715 )
    ( hoist-at hoist541 place541 )
    ( available hoist541 )
    ( hoist-at hoist557 place557 )
    ( available hoist557 )
    ( hoist-at hoist430 place430 )
    ( available hoist430 )
    ( hoist-at hoist532 place532 )
    ( available hoist532 )
    ( hoist-at hoist941 place941 )
    ( available hoist941 )
    ( hoist-at hoist815 place815 )
    ( available hoist815 )
    ( hoist-at hoist744 place744 )
    ( available hoist744 )
    ( hoist-at hoist127 place127 )
    ( available hoist127 )
    ( hoist-at hoist591 place591 )
    ( available hoist591 )
    ( hoist-at hoist488 place488 )
    ( available hoist488 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet922 place488 )
    ( surface-at crate922 place488 )
    ( on crate922 pallet922 )
    ( is-crate crate922 )
    ( clear crate922 )
    ( surface-at pallet400 place736 )
    ( surface-at crate400 place736 )
    ( on crate400 pallet400 )
    ( is-crate crate400 )
    ( clear crate400 )
    ( surface-at pallet348 place488 )
    ( surface-at crate348 place488 )
    ( on crate348 pallet348 )
    ( is-crate crate348 )
    ( clear crate348 )
    ( surface-at pallet557 place815 )
    ( surface-at crate557 place815 )
    ( on crate557 pallet557 )
    ( is-crate crate557 )
    ( clear crate557 )
    ( surface-at pallet58 place235 )
    ( surface-at crate58 place235 )
    ( on crate58 pallet58 )
    ( is-crate crate58 )
    ( clear crate58 )
    ( surface-at pallet728 place430 )
    ( surface-at crate728 place430 )
    ( on crate728 pallet728 )
    ( is-crate crate728 )
    ( clear crate728 )
    ( surface-at pallet944 place476 )
    ( surface-at crate944 place476 )
    ( on crate944 pallet944 )
    ( is-crate crate944 )
    ( clear crate944 )
    ( surface-at pallet470 place541 )
    ( surface-at crate470 place541 )
    ( on crate470 pallet470 )
    ( is-crate crate470 )
    ( clear crate470 )
    ( surface-at pallet142 place532 )
    ( surface-at crate142 place532 )
    ( on crate142 pallet142 )
    ( is-crate crate142 )
    ( clear crate142 )
    ( surface-at pallet428 place77 )
    ( surface-at crate428 place77 )
    ( on crate428 pallet428 )
    ( is-crate crate428 )
    ( clear crate428 )
    ( surface-at pallet508 place715 )
    ( surface-at crate508 place715 )
    ( on crate508 pallet508 )
    ( is-crate crate508 )
    ( clear crate508 )
    ( surface-at pallet664 place744 )
    ( surface-at crate664 place744 )
    ( on crate664 pallet664 )
    ( is-crate crate664 )
    ( clear crate664 )
  )
  ( :tasks
    ( Make-12Crate crate922 crate400 crate348 crate557 crate58 crate728 crate944 crate470 crate142 crate428 crate508 crate664 l000 )
  )
)
