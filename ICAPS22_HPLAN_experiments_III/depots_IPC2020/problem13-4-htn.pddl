( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place810 - place
    hoist810 - hoist
    place999 - place
    hoist999 - hoist
    place761 - place
    hoist761 - hoist
    place575 - place
    hoist575 - hoist
    place212 - place
    hoist212 - hoist
    place57 - place
    hoist57 - hoist
    place557 - place
    hoist557 - hoist
    place160 - place
    hoist160 - hoist
    place946 - place
    hoist946 - hoist
    place748 - place
    hoist748 - hoist
    place848 - place
    hoist848 - hoist
    place213 - place
    hoist213 - hoist
    place436 - place
    hoist436 - hoist
    place493 - place
    hoist493 - hoist
    place377 - place
    hoist377 - hoist
    place646 - place
    hoist646 - hoist
    place435 - place
    hoist435 - hoist
    place321 - place
    hoist321 - hoist
    place472 - place
    hoist472 - hoist
    place268 - place
    hoist268 - hoist
    place451 - place
    hoist451 - hoist
    place0 - place
    hoist0 - hoist
    crate715 - surface
    pallet715 - surface
    crate220 - surface
    pallet220 - surface
    crate339 - surface
    pallet339 - surface
    crate798 - surface
    pallet798 - surface
    crate954 - surface
    pallet954 - surface
    crate930 - surface
    pallet930 - surface
    crate735 - surface
    pallet735 - surface
    crate730 - surface
    pallet730 - surface
    crate251 - surface
    pallet251 - surface
    crate705 - surface
    pallet705 - surface
    crate229 - surface
    pallet229 - surface
    crate210 - surface
    pallet210 - surface
    crate299 - surface
    pallet299 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist810 place810 )
    ( available hoist810 )
    ( hoist-at hoist999 place999 )
    ( available hoist999 )
    ( hoist-at hoist761 place761 )
    ( available hoist761 )
    ( hoist-at hoist575 place575 )
    ( available hoist575 )
    ( hoist-at hoist212 place212 )
    ( available hoist212 )
    ( hoist-at hoist57 place57 )
    ( available hoist57 )
    ( hoist-at hoist557 place557 )
    ( available hoist557 )
    ( hoist-at hoist160 place160 )
    ( available hoist160 )
    ( hoist-at hoist946 place946 )
    ( available hoist946 )
    ( hoist-at hoist748 place748 )
    ( available hoist748 )
    ( hoist-at hoist848 place848 )
    ( available hoist848 )
    ( hoist-at hoist213 place213 )
    ( available hoist213 )
    ( hoist-at hoist436 place436 )
    ( available hoist436 )
    ( hoist-at hoist493 place493 )
    ( available hoist493 )
    ( hoist-at hoist377 place377 )
    ( available hoist377 )
    ( hoist-at hoist646 place646 )
    ( available hoist646 )
    ( hoist-at hoist435 place435 )
    ( available hoist435 )
    ( hoist-at hoist321 place321 )
    ( available hoist321 )
    ( hoist-at hoist472 place472 )
    ( available hoist472 )
    ( hoist-at hoist268 place268 )
    ( available hoist268 )
    ( hoist-at hoist451 place451 )
    ( available hoist451 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet715 place57 )
    ( surface-at crate715 place57 )
    ( on crate715 pallet715 )
    ( is-crate crate715 )
    ( clear crate715 )
    ( surface-at pallet220 place213 )
    ( surface-at crate220 place213 )
    ( on crate220 pallet220 )
    ( is-crate crate220 )
    ( clear crate220 )
    ( surface-at pallet339 place748 )
    ( surface-at crate339 place748 )
    ( on crate339 pallet339 )
    ( is-crate crate339 )
    ( clear crate339 )
    ( surface-at pallet798 place646 )
    ( surface-at crate798 place646 )
    ( on crate798 pallet798 )
    ( is-crate crate798 )
    ( clear crate798 )
    ( surface-at pallet954 place848 )
    ( surface-at crate954 place848 )
    ( on crate954 pallet954 )
    ( is-crate crate954 )
    ( clear crate954 )
    ( surface-at pallet930 place268 )
    ( surface-at crate930 place268 )
    ( on crate930 pallet930 )
    ( is-crate crate930 )
    ( clear crate930 )
    ( surface-at pallet735 place435 )
    ( surface-at crate735 place435 )
    ( on crate735 pallet735 )
    ( is-crate crate735 )
    ( clear crate735 )
    ( surface-at pallet730 place436 )
    ( surface-at crate730 place436 )
    ( on crate730 pallet730 )
    ( is-crate crate730 )
    ( clear crate730 )
    ( surface-at pallet251 place557 )
    ( surface-at crate251 place557 )
    ( on crate251 pallet251 )
    ( is-crate crate251 )
    ( clear crate251 )
    ( surface-at pallet705 place557 )
    ( surface-at crate705 place557 )
    ( on crate705 pallet705 )
    ( is-crate crate705 )
    ( clear crate705 )
    ( surface-at pallet229 place575 )
    ( surface-at crate229 place575 )
    ( on crate229 pallet229 )
    ( is-crate crate229 )
    ( clear crate229 )
    ( surface-at pallet210 place472 )
    ( surface-at crate210 place472 )
    ( on crate210 pallet210 )
    ( is-crate crate210 )
    ( clear crate210 )
    ( surface-at pallet299 place999 )
    ( surface-at crate299 place999 )
    ( on crate299 pallet299 )
    ( is-crate crate299 )
    ( clear crate299 )
  )
  ( :tasks
    ( Make-13Crate pallet0 crate715 crate220 crate339 crate798 crate954 crate930 crate735 crate730 crate251 crate705 crate229 crate210 crate299 )
  )
)
