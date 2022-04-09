( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place109 - place
    hoist109 - hoist
    place956 - place
    hoist956 - hoist
    place42 - place
    hoist42 - hoist
    place117 - place
    hoist117 - hoist
    place137 - place
    hoist137 - hoist
    place428 - place
    hoist428 - hoist
    place543 - place
    hoist543 - hoist
    place457 - place
    hoist457 - hoist
    place794 - place
    hoist794 - hoist
    place533 - place
    hoist533 - hoist
    place380 - place
    hoist380 - hoist
    place828 - place
    hoist828 - hoist
    place690 - place
    hoist690 - hoist
    place997 - place
    hoist997 - hoist
    place1 - place
    hoist1 - hoist
    place391 - place
    hoist391 - hoist
    place548 - place
    hoist548 - hoist
    place0 - place
    hoist0 - hoist
    crate681 - surface
    pallet681 - surface
    crate929 - surface
    pallet929 - surface
    crate105 - surface
    pallet105 - surface
    crate897 - surface
    pallet897 - surface
    crate553 - surface
    pallet553 - surface
    crate237 - surface
    pallet237 - surface
    crate138 - surface
    pallet138 - surface
    crate808 - surface
    pallet808 - surface
    crate809 - surface
    pallet809 - surface
    crate192 - surface
    pallet192 - surface
    crate223 - surface
    pallet223 - surface
    crate182 - surface
    pallet182 - surface
    crate622 - surface
    pallet622 - surface
    crate981 - surface
    pallet981 - surface
    crate408 - surface
    pallet408 - surface
    crate851 - surface
    pallet851 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist109 place109 )
    ( available hoist109 )
    ( hoist-at hoist956 place956 )
    ( available hoist956 )
    ( hoist-at hoist42 place42 )
    ( available hoist42 )
    ( hoist-at hoist117 place117 )
    ( available hoist117 )
    ( hoist-at hoist137 place137 )
    ( available hoist137 )
    ( hoist-at hoist428 place428 )
    ( available hoist428 )
    ( hoist-at hoist543 place543 )
    ( available hoist543 )
    ( hoist-at hoist457 place457 )
    ( available hoist457 )
    ( hoist-at hoist794 place794 )
    ( available hoist794 )
    ( hoist-at hoist533 place533 )
    ( available hoist533 )
    ( hoist-at hoist380 place380 )
    ( available hoist380 )
    ( hoist-at hoist828 place828 )
    ( available hoist828 )
    ( hoist-at hoist690 place690 )
    ( available hoist690 )
    ( hoist-at hoist997 place997 )
    ( available hoist997 )
    ( hoist-at hoist1 place1 )
    ( available hoist1 )
    ( hoist-at hoist391 place391 )
    ( available hoist391 )
    ( hoist-at hoist548 place548 )
    ( available hoist548 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet681 place137 )
    ( surface-at crate681 place137 )
    ( on crate681 pallet681 )
    ( is-crate crate681 )
    ( clear crate681 )
    ( surface-at pallet929 place828 )
    ( surface-at crate929 place828 )
    ( on crate929 pallet929 )
    ( is-crate crate929 )
    ( clear crate929 )
    ( surface-at pallet105 place1 )
    ( surface-at crate105 place1 )
    ( on crate105 pallet105 )
    ( is-crate crate105 )
    ( clear crate105 )
    ( surface-at pallet897 place391 )
    ( surface-at crate897 place391 )
    ( on crate897 pallet897 )
    ( is-crate crate897 )
    ( clear crate897 )
    ( surface-at pallet553 place391 )
    ( surface-at crate553 place391 )
    ( on crate553 pallet553 )
    ( is-crate crate553 )
    ( clear crate553 )
    ( surface-at pallet237 place42 )
    ( surface-at crate237 place42 )
    ( on crate237 pallet237 )
    ( is-crate crate237 )
    ( clear crate237 )
    ( surface-at pallet138 place428 )
    ( surface-at crate138 place428 )
    ( on crate138 pallet138 )
    ( is-crate crate138 )
    ( clear crate138 )
    ( surface-at pallet808 place109 )
    ( surface-at crate808 place109 )
    ( on crate808 pallet808 )
    ( is-crate crate808 )
    ( clear crate808 )
    ( surface-at pallet809 place380 )
    ( surface-at crate809 place380 )
    ( on crate809 pallet809 )
    ( is-crate crate809 )
    ( clear crate809 )
    ( surface-at pallet192 place690 )
    ( surface-at crate192 place690 )
    ( on crate192 pallet192 )
    ( is-crate crate192 )
    ( clear crate192 )
    ( surface-at pallet223 place828 )
    ( surface-at crate223 place828 )
    ( on crate223 pallet223 )
    ( is-crate crate223 )
    ( clear crate223 )
    ( surface-at pallet182 place391 )
    ( surface-at crate182 place391 )
    ( on crate182 pallet182 )
    ( is-crate crate182 )
    ( clear crate182 )
    ( surface-at pallet622 place137 )
    ( surface-at crate622 place137 )
    ( on crate622 pallet622 )
    ( is-crate crate622 )
    ( clear crate622 )
    ( surface-at pallet981 place109 )
    ( surface-at crate981 place109 )
    ( on crate981 pallet981 )
    ( is-crate crate981 )
    ( clear crate981 )
    ( surface-at pallet408 place457 )
    ( surface-at crate408 place457 )
    ( on crate408 pallet408 )
    ( is-crate crate408 )
    ( clear crate408 )
    ( surface-at pallet851 place380 )
    ( surface-at crate851 place380 )
    ( on crate851 pallet851 )
    ( is-crate crate851 )
    ( clear crate851 )
  )
  ( :tasks
    ( Make-16Crate crate681 crate929 crate105 crate897 crate553 crate237 crate138 crate808 crate809 crate192 crate223 crate182 crate622 crate981 crate408 crate851 l000 )
  )
)
