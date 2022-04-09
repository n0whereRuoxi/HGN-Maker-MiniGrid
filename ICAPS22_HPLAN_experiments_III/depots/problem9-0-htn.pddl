( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place270 - place
    hoist270 - hoist
    place185 - place
    hoist185 - hoist
    place693 - place
    hoist693 - hoist
    place184 - place
    hoist184 - hoist
    place900 - place
    hoist900 - hoist
    place385 - place
    hoist385 - hoist
    place563 - place
    hoist563 - hoist
    place813 - place
    hoist813 - hoist
    place938 - place
    hoist938 - hoist
    place296 - place
    hoist296 - hoist
    place842 - place
    hoist842 - hoist
    place417 - place
    hoist417 - hoist
    place863 - place
    hoist863 - hoist
    place251 - place
    hoist251 - hoist
    place305 - place
    hoist305 - hoist
    place9 - place
    hoist9 - hoist
    place289 - place
    hoist289 - hoist
    place510 - place
    hoist510 - hoist
    place0 - place
    hoist0 - hoist
    crate989 - surface
    pallet989 - surface
    crate392 - surface
    pallet392 - surface
    crate840 - surface
    pallet840 - surface
    crate459 - surface
    pallet459 - surface
    crate781 - surface
    pallet781 - surface
    crate689 - surface
    pallet689 - surface
    crate570 - surface
    pallet570 - surface
    crate414 - surface
    pallet414 - surface
    crate151 - surface
    pallet151 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist270 place270 )
    ( available hoist270 )
    ( hoist-at hoist185 place185 )
    ( available hoist185 )
    ( hoist-at hoist693 place693 )
    ( available hoist693 )
    ( hoist-at hoist184 place184 )
    ( available hoist184 )
    ( hoist-at hoist900 place900 )
    ( available hoist900 )
    ( hoist-at hoist385 place385 )
    ( available hoist385 )
    ( hoist-at hoist563 place563 )
    ( available hoist563 )
    ( hoist-at hoist813 place813 )
    ( available hoist813 )
    ( hoist-at hoist938 place938 )
    ( available hoist938 )
    ( hoist-at hoist296 place296 )
    ( available hoist296 )
    ( hoist-at hoist842 place842 )
    ( available hoist842 )
    ( hoist-at hoist417 place417 )
    ( available hoist417 )
    ( hoist-at hoist863 place863 )
    ( available hoist863 )
    ( hoist-at hoist251 place251 )
    ( available hoist251 )
    ( hoist-at hoist305 place305 )
    ( available hoist305 )
    ( hoist-at hoist9 place9 )
    ( available hoist9 )
    ( hoist-at hoist289 place289 )
    ( available hoist289 )
    ( hoist-at hoist510 place510 )
    ( available hoist510 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet989 place863 )
    ( surface-at crate989 place863 )
    ( on crate989 pallet989 )
    ( is-crate crate989 )
    ( clear crate989 )
    ( surface-at pallet392 place305 )
    ( surface-at crate392 place305 )
    ( on crate392 pallet392 )
    ( is-crate crate392 )
    ( clear crate392 )
    ( surface-at pallet840 place289 )
    ( surface-at crate840 place289 )
    ( on crate840 pallet840 )
    ( is-crate crate840 )
    ( clear crate840 )
    ( surface-at pallet459 place385 )
    ( surface-at crate459 place385 )
    ( on crate459 pallet459 )
    ( is-crate crate459 )
    ( clear crate459 )
    ( surface-at pallet781 place510 )
    ( surface-at crate781 place510 )
    ( on crate781 pallet781 )
    ( is-crate crate781 )
    ( clear crate781 )
    ( surface-at pallet689 place417 )
    ( surface-at crate689 place417 )
    ( on crate689 pallet689 )
    ( is-crate crate689 )
    ( clear crate689 )
    ( surface-at pallet570 place185 )
    ( surface-at crate570 place185 )
    ( on crate570 pallet570 )
    ( is-crate crate570 )
    ( clear crate570 )
    ( surface-at pallet414 place251 )
    ( surface-at crate414 place251 )
    ( on crate414 pallet414 )
    ( is-crate crate414 )
    ( clear crate414 )
    ( surface-at pallet151 place305 )
    ( surface-at crate151 place305 )
    ( on crate151 pallet151 )
    ( is-crate crate151 )
    ( clear crate151 )
  )
  ( :tasks
    ( Make-9Crate pallet0 crate989 crate392 crate840 crate459 crate781 crate689 crate570 crate414 crate151 )
  )
)
