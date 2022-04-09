( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place802 - place
    hoist802 - hoist
    place63 - place
    hoist63 - hoist
    place724 - place
    hoist724 - hoist
    place725 - place
    hoist725 - hoist
    place67 - place
    hoist67 - hoist
    place473 - place
    hoist473 - hoist
    place730 - place
    hoist730 - hoist
    place265 - place
    hoist265 - hoist
    place868 - place
    hoist868 - hoist
    place481 - place
    hoist481 - hoist
    place245 - place
    hoist245 - hoist
    place322 - place
    hoist322 - hoist
    place603 - place
    hoist603 - hoist
    place786 - place
    hoist786 - hoist
    place369 - place
    hoist369 - hoist
    place55 - place
    hoist55 - hoist
    place11 - place
    hoist11 - hoist
    place834 - place
    hoist834 - hoist
    place641 - place
    hoist641 - hoist
    place234 - place
    hoist234 - hoist
    place398 - place
    hoist398 - hoist
    place0 - place
    hoist0 - hoist
    crate679 - surface
    pallet679 - surface
    crate124 - surface
    pallet124 - surface
    crate898 - surface
    pallet898 - surface
    crate648 - surface
    pallet648 - surface
    crate465 - surface
    pallet465 - surface
    crate152 - surface
    pallet152 - surface
    crate860 - surface
    pallet860 - surface
    crate825 - surface
    pallet825 - surface
    crate947 - surface
    pallet947 - surface
    crate214 - surface
    pallet214 - surface
    crate901 - surface
    pallet901 - surface
    crate17 - surface
    pallet17 - surface
    crate950 - surface
    pallet950 - surface
    crate779 - surface
    pallet779 - surface
    crate76 - surface
    pallet76 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist802 place802 )
    ( available hoist802 )
    ( hoist-at hoist63 place63 )
    ( available hoist63 )
    ( hoist-at hoist724 place724 )
    ( available hoist724 )
    ( hoist-at hoist725 place725 )
    ( available hoist725 )
    ( hoist-at hoist67 place67 )
    ( available hoist67 )
    ( hoist-at hoist473 place473 )
    ( available hoist473 )
    ( hoist-at hoist730 place730 )
    ( available hoist730 )
    ( hoist-at hoist265 place265 )
    ( available hoist265 )
    ( hoist-at hoist868 place868 )
    ( available hoist868 )
    ( hoist-at hoist481 place481 )
    ( available hoist481 )
    ( hoist-at hoist245 place245 )
    ( available hoist245 )
    ( hoist-at hoist322 place322 )
    ( available hoist322 )
    ( hoist-at hoist603 place603 )
    ( available hoist603 )
    ( hoist-at hoist786 place786 )
    ( available hoist786 )
    ( hoist-at hoist369 place369 )
    ( available hoist369 )
    ( hoist-at hoist55 place55 )
    ( available hoist55 )
    ( hoist-at hoist11 place11 )
    ( available hoist11 )
    ( hoist-at hoist834 place834 )
    ( available hoist834 )
    ( hoist-at hoist641 place641 )
    ( available hoist641 )
    ( hoist-at hoist234 place234 )
    ( available hoist234 )
    ( hoist-at hoist398 place398 )
    ( available hoist398 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet679 place245 )
    ( surface-at crate679 place245 )
    ( on crate679 pallet679 )
    ( is-crate crate679 )
    ( clear crate679 )
    ( surface-at pallet124 place245 )
    ( surface-at crate124 place245 )
    ( on crate124 pallet124 )
    ( is-crate crate124 )
    ( clear crate124 )
    ( surface-at pallet898 place245 )
    ( surface-at crate898 place245 )
    ( on crate898 pallet898 )
    ( is-crate crate898 )
    ( clear crate898 )
    ( surface-at pallet648 place481 )
    ( surface-at crate648 place481 )
    ( on crate648 pallet648 )
    ( is-crate crate648 )
    ( clear crate648 )
    ( surface-at pallet465 place725 )
    ( surface-at crate465 place725 )
    ( on crate465 pallet465 )
    ( is-crate crate465 )
    ( clear crate465 )
    ( surface-at pallet152 place63 )
    ( surface-at crate152 place63 )
    ( on crate152 pallet152 )
    ( is-crate crate152 )
    ( clear crate152 )
    ( surface-at pallet860 place724 )
    ( surface-at crate860 place724 )
    ( on crate860 pallet860 )
    ( is-crate crate860 )
    ( clear crate860 )
    ( surface-at pallet825 place369 )
    ( surface-at crate825 place369 )
    ( on crate825 pallet825 )
    ( is-crate crate825 )
    ( clear crate825 )
    ( surface-at pallet947 place725 )
    ( surface-at crate947 place725 )
    ( on crate947 pallet947 )
    ( is-crate crate947 )
    ( clear crate947 )
    ( surface-at pallet214 place834 )
    ( surface-at crate214 place834 )
    ( on crate214 pallet214 )
    ( is-crate crate214 )
    ( clear crate214 )
    ( surface-at pallet901 place369 )
    ( surface-at crate901 place369 )
    ( on crate901 pallet901 )
    ( is-crate crate901 )
    ( clear crate901 )
    ( surface-at pallet17 place234 )
    ( surface-at crate17 place234 )
    ( on crate17 pallet17 )
    ( is-crate crate17 )
    ( clear crate17 )
    ( surface-at pallet950 place725 )
    ( surface-at crate950 place725 )
    ( on crate950 pallet950 )
    ( is-crate crate950 )
    ( clear crate950 )
    ( surface-at pallet779 place730 )
    ( surface-at crate779 place730 )
    ( on crate779 pallet779 )
    ( is-crate crate779 )
    ( clear crate779 )
    ( surface-at pallet76 place868 )
    ( surface-at crate76 place868 )
    ( on crate76 pallet76 )
    ( is-crate crate76 )
    ( clear crate76 )
  )
  ( :tasks
    ( Make-15Crate crate679 crate124 crate898 crate648 crate465 crate152 crate860 crate825 crate947 crate214 crate901 crate17 crate950 crate779 crate76 l000 )
  )
)
