( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place774 - place
    hoist774 - hoist
    place156 - place
    hoist156 - hoist
    place101 - place
    hoist101 - hoist
    place648 - place
    hoist648 - hoist
    place394 - place
    hoist394 - hoist
    place27 - place
    hoist27 - hoist
    place261 - place
    hoist261 - hoist
    place67 - place
    hoist67 - hoist
    place678 - place
    hoist678 - hoist
    place894 - place
    hoist894 - hoist
    place540 - place
    hoist540 - hoist
    place331 - place
    hoist331 - hoist
    place962 - place
    hoist962 - hoist
    place656 - place
    hoist656 - hoist
    place183 - place
    hoist183 - hoist
    place766 - place
    hoist766 - hoist
    place165 - place
    hoist165 - hoist
    place286 - place
    hoist286 - hoist
    place502 - place
    hoist502 - hoist
    place570 - place
    hoist570 - hoist
    place770 - place
    hoist770 - hoist
    place0 - place
    hoist0 - hoist
    crate836 - surface
    pallet836 - surface
    crate294 - surface
    pallet294 - surface
    crate248 - surface
    pallet248 - surface
    crate162 - surface
    pallet162 - surface
    crate260 - surface
    pallet260 - surface
    crate163 - surface
    pallet163 - surface
    crate453 - surface
    pallet453 - surface
    crate61 - surface
    pallet61 - surface
    crate447 - surface
    pallet447 - surface
    crate128 - surface
    pallet128 - surface
    crate631 - surface
    pallet631 - surface
    crate77 - surface
    pallet77 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist774 place774 )
    ( available hoist774 )
    ( hoist-at hoist156 place156 )
    ( available hoist156 )
    ( hoist-at hoist101 place101 )
    ( available hoist101 )
    ( hoist-at hoist648 place648 )
    ( available hoist648 )
    ( hoist-at hoist394 place394 )
    ( available hoist394 )
    ( hoist-at hoist27 place27 )
    ( available hoist27 )
    ( hoist-at hoist261 place261 )
    ( available hoist261 )
    ( hoist-at hoist67 place67 )
    ( available hoist67 )
    ( hoist-at hoist678 place678 )
    ( available hoist678 )
    ( hoist-at hoist894 place894 )
    ( available hoist894 )
    ( hoist-at hoist540 place540 )
    ( available hoist540 )
    ( hoist-at hoist331 place331 )
    ( available hoist331 )
    ( hoist-at hoist962 place962 )
    ( available hoist962 )
    ( hoist-at hoist656 place656 )
    ( available hoist656 )
    ( hoist-at hoist183 place183 )
    ( available hoist183 )
    ( hoist-at hoist766 place766 )
    ( available hoist766 )
    ( hoist-at hoist165 place165 )
    ( available hoist165 )
    ( hoist-at hoist286 place286 )
    ( available hoist286 )
    ( hoist-at hoist502 place502 )
    ( available hoist502 )
    ( hoist-at hoist570 place570 )
    ( available hoist570 )
    ( hoist-at hoist770 place770 )
    ( available hoist770 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet836 place286 )
    ( surface-at crate836 place286 )
    ( on crate836 pallet836 )
    ( is-crate crate836 )
    ( clear crate836 )
    ( surface-at pallet294 place540 )
    ( surface-at crate294 place540 )
    ( on crate294 pallet294 )
    ( is-crate crate294 )
    ( clear crate294 )
    ( surface-at pallet248 place156 )
    ( surface-at crate248 place156 )
    ( on crate248 pallet248 )
    ( is-crate crate248 )
    ( clear crate248 )
    ( surface-at pallet162 place183 )
    ( surface-at crate162 place183 )
    ( on crate162 pallet162 )
    ( is-crate crate162 )
    ( clear crate162 )
    ( surface-at pallet260 place502 )
    ( surface-at crate260 place502 )
    ( on crate260 pallet260 )
    ( is-crate crate260 )
    ( clear crate260 )
    ( surface-at pallet163 place774 )
    ( surface-at crate163 place774 )
    ( on crate163 pallet163 )
    ( is-crate crate163 )
    ( clear crate163 )
    ( surface-at pallet453 place67 )
    ( surface-at crate453 place67 )
    ( on crate453 pallet453 )
    ( is-crate crate453 )
    ( clear crate453 )
    ( surface-at pallet61 place656 )
    ( surface-at crate61 place656 )
    ( on crate61 pallet61 )
    ( is-crate crate61 )
    ( clear crate61 )
    ( surface-at pallet447 place656 )
    ( surface-at crate447 place656 )
    ( on crate447 pallet447 )
    ( is-crate crate447 )
    ( clear crate447 )
    ( surface-at pallet128 place183 )
    ( surface-at crate128 place183 )
    ( on crate128 pallet128 )
    ( is-crate crate128 )
    ( clear crate128 )
    ( surface-at pallet631 place165 )
    ( surface-at crate631 place165 )
    ( on crate631 pallet631 )
    ( is-crate crate631 )
    ( clear crate631 )
    ( surface-at pallet77 place894 )
    ( surface-at crate77 place894 )
    ( on crate77 pallet77 )
    ( is-crate crate77 )
    ( clear crate77 )
  )
  ( :tasks
    ( Make-12Crate crate836 crate294 crate248 crate162 crate260 crate163 crate453 crate61 crate447 crate128 crate631 crate77 l000 )
  )
)
