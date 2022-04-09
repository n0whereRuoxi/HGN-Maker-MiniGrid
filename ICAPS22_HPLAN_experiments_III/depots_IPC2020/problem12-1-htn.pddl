( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place308 - place
    hoist308 - hoist
    place270 - place
    hoist270 - hoist
    place998 - place
    hoist998 - hoist
    place819 - place
    hoist819 - hoist
    place451 - place
    hoist451 - hoist
    place516 - place
    hoist516 - hoist
    place355 - place
    hoist355 - hoist
    place177 - place
    hoist177 - hoist
    place547 - place
    hoist547 - hoist
    place807 - place
    hoist807 - hoist
    place979 - place
    hoist979 - hoist
    place0 - place
    hoist0 - hoist
    crate650 - surface
    pallet650 - surface
    crate728 - surface
    pallet728 - surface
    crate612 - surface
    pallet612 - surface
    crate977 - surface
    pallet977 - surface
    crate638 - surface
    pallet638 - surface
    crate232 - surface
    pallet232 - surface
    crate544 - surface
    pallet544 - surface
    crate344 - surface
    pallet344 - surface
    crate786 - surface
    pallet786 - surface
    crate490 - surface
    pallet490 - surface
    crate442 - surface
    pallet442 - surface
    crate696 - surface
    pallet696 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist308 place308 )
    ( available hoist308 )
    ( hoist-at hoist270 place270 )
    ( available hoist270 )
    ( hoist-at hoist998 place998 )
    ( available hoist998 )
    ( hoist-at hoist819 place819 )
    ( available hoist819 )
    ( hoist-at hoist451 place451 )
    ( available hoist451 )
    ( hoist-at hoist516 place516 )
    ( available hoist516 )
    ( hoist-at hoist355 place355 )
    ( available hoist355 )
    ( hoist-at hoist177 place177 )
    ( available hoist177 )
    ( hoist-at hoist547 place547 )
    ( available hoist547 )
    ( hoist-at hoist807 place807 )
    ( available hoist807 )
    ( hoist-at hoist979 place979 )
    ( available hoist979 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet650 place516 )
    ( surface-at crate650 place516 )
    ( on crate650 pallet650 )
    ( is-crate crate650 )
    ( clear crate650 )
    ( surface-at pallet728 place979 )
    ( surface-at crate728 place979 )
    ( on crate728 pallet728 )
    ( is-crate crate728 )
    ( clear crate728 )
    ( surface-at pallet612 place547 )
    ( surface-at crate612 place547 )
    ( on crate612 pallet612 )
    ( is-crate crate612 )
    ( clear crate612 )
    ( surface-at pallet977 place270 )
    ( surface-at crate977 place270 )
    ( on crate977 pallet977 )
    ( is-crate crate977 )
    ( clear crate977 )
    ( surface-at pallet638 place270 )
    ( surface-at crate638 place270 )
    ( on crate638 pallet638 )
    ( is-crate crate638 )
    ( clear crate638 )
    ( surface-at pallet232 place270 )
    ( surface-at crate232 place270 )
    ( on crate232 pallet232 )
    ( is-crate crate232 )
    ( clear crate232 )
    ( surface-at pallet544 place819 )
    ( surface-at crate544 place819 )
    ( on crate544 pallet544 )
    ( is-crate crate544 )
    ( clear crate544 )
    ( surface-at pallet344 place807 )
    ( surface-at crate344 place807 )
    ( on crate344 pallet344 )
    ( is-crate crate344 )
    ( clear crate344 )
    ( surface-at pallet786 place547 )
    ( surface-at crate786 place547 )
    ( on crate786 pallet786 )
    ( is-crate crate786 )
    ( clear crate786 )
    ( surface-at pallet490 place451 )
    ( surface-at crate490 place451 )
    ( on crate490 pallet490 )
    ( is-crate crate490 )
    ( clear crate490 )
    ( surface-at pallet442 place516 )
    ( surface-at crate442 place516 )
    ( on crate442 pallet442 )
    ( is-crate crate442 )
    ( clear crate442 )
    ( surface-at pallet696 place819 )
    ( surface-at crate696 place819 )
    ( on crate696 pallet696 )
    ( is-crate crate696 )
    ( clear crate696 )
  )
  ( :tasks
    ( Make-12Crate pallet0 crate650 crate728 crate612 crate977 crate638 crate232 crate544 crate344 crate786 crate490 crate442 crate696 )
  )
)
