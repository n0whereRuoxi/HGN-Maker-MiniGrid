( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place866 - place
    hoist866 - hoist
    place860 - place
    hoist860 - hoist
    place440 - place
    hoist440 - hoist
    place453 - place
    hoist453 - hoist
    place656 - place
    hoist656 - hoist
    place707 - place
    hoist707 - hoist
    place135 - place
    hoist135 - hoist
    place251 - place
    hoist251 - hoist
    place872 - place
    hoist872 - hoist
    place332 - place
    hoist332 - hoist
    place819 - place
    hoist819 - hoist
    place951 - place
    hoist951 - hoist
    place161 - place
    hoist161 - hoist
    place156 - place
    hoist156 - hoist
    place551 - place
    hoist551 - hoist
    place906 - place
    hoist906 - hoist
    place44 - place
    hoist44 - hoist
    place831 - place
    hoist831 - hoist
    place386 - place
    hoist386 - hoist
    place295 - place
    hoist295 - hoist
    place669 - place
    hoist669 - hoist
    place363 - place
    hoist363 - hoist
    place460 - place
    hoist460 - hoist
    place715 - place
    hoist715 - hoist
    place55 - place
    hoist55 - hoist
    place712 - place
    hoist712 - hoist
    place412 - place
    hoist412 - hoist
    place78 - place
    hoist78 - hoist
    place444 - place
    hoist444 - hoist
    place511 - place
    hoist511 - hoist
    place0 - place
    hoist0 - hoist
    crate10 - surface
    pallet10 - surface
    crate506 - surface
    pallet506 - surface
    crate146 - surface
    pallet146 - surface
    crate785 - surface
    pallet785 - surface
    crate562 - surface
    pallet562 - surface
    crate304 - surface
    pallet304 - surface
    crate687 - surface
    pallet687 - surface
    crate240 - surface
    pallet240 - surface
    crate779 - surface
    pallet779 - surface
    crate507 - surface
    pallet507 - surface
    crate211 - surface
    pallet211 - surface
    crate70 - surface
    pallet70 - surface
    crate408 - surface
    pallet408 - surface
    crate337 - surface
    pallet337 - surface
    crate528 - surface
    pallet528 - surface
    crate438 - surface
    pallet438 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist866 place866 )
    ( available hoist866 )
    ( hoist-at hoist860 place860 )
    ( available hoist860 )
    ( hoist-at hoist440 place440 )
    ( available hoist440 )
    ( hoist-at hoist453 place453 )
    ( available hoist453 )
    ( hoist-at hoist656 place656 )
    ( available hoist656 )
    ( hoist-at hoist707 place707 )
    ( available hoist707 )
    ( hoist-at hoist135 place135 )
    ( available hoist135 )
    ( hoist-at hoist251 place251 )
    ( available hoist251 )
    ( hoist-at hoist872 place872 )
    ( available hoist872 )
    ( hoist-at hoist332 place332 )
    ( available hoist332 )
    ( hoist-at hoist819 place819 )
    ( available hoist819 )
    ( hoist-at hoist951 place951 )
    ( available hoist951 )
    ( hoist-at hoist161 place161 )
    ( available hoist161 )
    ( hoist-at hoist156 place156 )
    ( available hoist156 )
    ( hoist-at hoist551 place551 )
    ( available hoist551 )
    ( hoist-at hoist906 place906 )
    ( available hoist906 )
    ( hoist-at hoist44 place44 )
    ( available hoist44 )
    ( hoist-at hoist831 place831 )
    ( available hoist831 )
    ( hoist-at hoist386 place386 )
    ( available hoist386 )
    ( hoist-at hoist295 place295 )
    ( available hoist295 )
    ( hoist-at hoist669 place669 )
    ( available hoist669 )
    ( hoist-at hoist363 place363 )
    ( available hoist363 )
    ( hoist-at hoist460 place460 )
    ( available hoist460 )
    ( hoist-at hoist715 place715 )
    ( available hoist715 )
    ( hoist-at hoist55 place55 )
    ( available hoist55 )
    ( hoist-at hoist712 place712 )
    ( available hoist712 )
    ( hoist-at hoist412 place412 )
    ( available hoist412 )
    ( hoist-at hoist78 place78 )
    ( available hoist78 )
    ( hoist-at hoist444 place444 )
    ( available hoist444 )
    ( hoist-at hoist511 place511 )
    ( available hoist511 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet10 place656 )
    ( surface-at crate10 place656 )
    ( on crate10 pallet10 )
    ( is-crate crate10 )
    ( clear crate10 )
    ( surface-at pallet506 place831 )
    ( surface-at crate506 place831 )
    ( on crate506 pallet506 )
    ( is-crate crate506 )
    ( clear crate506 )
    ( surface-at pallet146 place135 )
    ( surface-at crate146 place135 )
    ( on crate146 pallet146 )
    ( is-crate crate146 )
    ( clear crate146 )
    ( surface-at pallet785 place707 )
    ( surface-at crate785 place707 )
    ( on crate785 pallet785 )
    ( is-crate crate785 )
    ( clear crate785 )
    ( surface-at pallet562 place161 )
    ( surface-at crate562 place161 )
    ( on crate562 pallet562 )
    ( is-crate crate562 )
    ( clear crate562 )
    ( surface-at pallet304 place831 )
    ( surface-at crate304 place831 )
    ( on crate304 pallet304 )
    ( is-crate crate304 )
    ( clear crate304 )
    ( surface-at pallet687 place872 )
    ( surface-at crate687 place872 )
    ( on crate687 pallet687 )
    ( is-crate crate687 )
    ( clear crate687 )
    ( surface-at pallet240 place251 )
    ( surface-at crate240 place251 )
    ( on crate240 pallet240 )
    ( is-crate crate240 )
    ( clear crate240 )
    ( surface-at pallet779 place511 )
    ( surface-at crate779 place511 )
    ( on crate779 pallet779 )
    ( is-crate crate779 )
    ( clear crate779 )
    ( surface-at pallet507 place440 )
    ( surface-at crate507 place440 )
    ( on crate507 pallet507 )
    ( is-crate crate507 )
    ( clear crate507 )
    ( surface-at pallet211 place161 )
    ( surface-at crate211 place161 )
    ( on crate211 pallet211 )
    ( is-crate crate211 )
    ( clear crate211 )
    ( surface-at pallet70 place161 )
    ( surface-at crate70 place161 )
    ( on crate70 pallet70 )
    ( is-crate crate70 )
    ( clear crate70 )
    ( surface-at pallet408 place386 )
    ( surface-at crate408 place386 )
    ( on crate408 pallet408 )
    ( is-crate crate408 )
    ( clear crate408 )
    ( surface-at pallet337 place831 )
    ( surface-at crate337 place831 )
    ( on crate337 pallet337 )
    ( is-crate crate337 )
    ( clear crate337 )
    ( surface-at pallet528 place295 )
    ( surface-at crate528 place295 )
    ( on crate528 pallet528 )
    ( is-crate crate528 )
    ( clear crate528 )
    ( surface-at pallet438 place55 )
    ( surface-at crate438 place55 )
    ( on crate438 pallet438 )
    ( is-crate crate438 )
    ( clear crate438 )
  )
  ( :goal
    ( and
    )
  )
)
