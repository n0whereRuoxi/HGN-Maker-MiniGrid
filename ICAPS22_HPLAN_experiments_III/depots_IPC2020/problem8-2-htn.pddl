( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place441 - place
    hoist441 - hoist
    place144 - place
    hoist144 - hoist
    place271 - place
    hoist271 - hoist
    place296 - place
    hoist296 - hoist
    place785 - place
    hoist785 - hoist
    place235 - place
    hoist235 - hoist
    place614 - place
    hoist614 - hoist
    place53 - place
    hoist53 - hoist
    place557 - place
    hoist557 - hoist
    place516 - place
    hoist516 - hoist
    place723 - place
    hoist723 - hoist
    place409 - place
    hoist409 - hoist
    place456 - place
    hoist456 - hoist
    place532 - place
    hoist532 - hoist
    place568 - place
    hoist568 - hoist
    place0 - place
    hoist0 - hoist
    crate356 - surface
    pallet356 - surface
    crate313 - surface
    pallet313 - surface
    crate892 - surface
    pallet892 - surface
    crate177 - surface
    pallet177 - surface
    crate559 - surface
    pallet559 - surface
    crate468 - surface
    pallet468 - surface
    crate338 - surface
    pallet338 - surface
    crate874 - surface
    pallet874 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist441 place441 )
    ( available hoist441 )
    ( hoist-at hoist144 place144 )
    ( available hoist144 )
    ( hoist-at hoist271 place271 )
    ( available hoist271 )
    ( hoist-at hoist296 place296 )
    ( available hoist296 )
    ( hoist-at hoist785 place785 )
    ( available hoist785 )
    ( hoist-at hoist235 place235 )
    ( available hoist235 )
    ( hoist-at hoist614 place614 )
    ( available hoist614 )
    ( hoist-at hoist53 place53 )
    ( available hoist53 )
    ( hoist-at hoist557 place557 )
    ( available hoist557 )
    ( hoist-at hoist516 place516 )
    ( available hoist516 )
    ( hoist-at hoist723 place723 )
    ( available hoist723 )
    ( hoist-at hoist409 place409 )
    ( available hoist409 )
    ( hoist-at hoist456 place456 )
    ( available hoist456 )
    ( hoist-at hoist532 place532 )
    ( available hoist532 )
    ( hoist-at hoist568 place568 )
    ( available hoist568 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet356 place53 )
    ( surface-at crate356 place53 )
    ( on crate356 pallet356 )
    ( is-crate crate356 )
    ( clear crate356 )
    ( surface-at pallet313 place532 )
    ( surface-at crate313 place532 )
    ( on crate313 pallet313 )
    ( is-crate crate313 )
    ( clear crate313 )
    ( surface-at pallet892 place723 )
    ( surface-at crate892 place723 )
    ( on crate892 pallet892 )
    ( is-crate crate892 )
    ( clear crate892 )
    ( surface-at pallet177 place456 )
    ( surface-at crate177 place456 )
    ( on crate177 pallet177 )
    ( is-crate crate177 )
    ( clear crate177 )
    ( surface-at pallet559 place614 )
    ( surface-at crate559 place614 )
    ( on crate559 pallet559 )
    ( is-crate crate559 )
    ( clear crate559 )
    ( surface-at pallet468 place557 )
    ( surface-at crate468 place557 )
    ( on crate468 pallet468 )
    ( is-crate crate468 )
    ( clear crate468 )
    ( surface-at pallet338 place568 )
    ( surface-at crate338 place568 )
    ( on crate338 pallet338 )
    ( is-crate crate338 )
    ( clear crate338 )
    ( surface-at pallet874 place235 )
    ( surface-at crate874 place235 )
    ( on crate874 pallet874 )
    ( is-crate crate874 )
    ( clear crate874 )
  )
  ( :tasks
    ( Make-8Crate pallet0 crate356 crate313 crate892 crate177 crate559 crate468 crate338 crate874 )
  )
)
