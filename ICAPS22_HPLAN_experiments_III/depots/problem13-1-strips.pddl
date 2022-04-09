( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place363 - place
    hoist363 - hoist
    place529 - place
    hoist529 - hoist
    place82 - place
    hoist82 - hoist
    place1 - place
    hoist1 - hoist
    place441 - place
    hoist441 - hoist
    place570 - place
    hoist570 - hoist
    place59 - place
    hoist59 - hoist
    place295 - place
    hoist295 - hoist
    place147 - place
    hoist147 - hoist
    place19 - place
    hoist19 - hoist
    place85 - place
    hoist85 - hoist
    place659 - place
    hoist659 - hoist
    place317 - place
    hoist317 - hoist
    place660 - place
    hoist660 - hoist
    place638 - place
    hoist638 - hoist
    place751 - place
    hoist751 - hoist
    place883 - place
    hoist883 - hoist
    place86 - place
    hoist86 - hoist
    place827 - place
    hoist827 - hoist
    place589 - place
    hoist589 - hoist
    place468 - place
    hoist468 - hoist
    place0 - place
    hoist0 - hoist
    crate356 - surface
    pallet356 - surface
    crate172 - surface
    pallet172 - surface
    crate217 - surface
    pallet217 - surface
    crate855 - surface
    pallet855 - surface
    crate320 - surface
    pallet320 - surface
    crate367 - surface
    pallet367 - surface
    crate319 - surface
    pallet319 - surface
    crate999 - surface
    pallet999 - surface
    crate164 - surface
    pallet164 - surface
    crate6 - surface
    pallet6 - surface
    crate432 - surface
    pallet432 - surface
    crate720 - surface
    pallet720 - surface
    crate804 - surface
    pallet804 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist363 place363 )
    ( available hoist363 )
    ( hoist-at hoist529 place529 )
    ( available hoist529 )
    ( hoist-at hoist82 place82 )
    ( available hoist82 )
    ( hoist-at hoist1 place1 )
    ( available hoist1 )
    ( hoist-at hoist441 place441 )
    ( available hoist441 )
    ( hoist-at hoist570 place570 )
    ( available hoist570 )
    ( hoist-at hoist59 place59 )
    ( available hoist59 )
    ( hoist-at hoist295 place295 )
    ( available hoist295 )
    ( hoist-at hoist147 place147 )
    ( available hoist147 )
    ( hoist-at hoist19 place19 )
    ( available hoist19 )
    ( hoist-at hoist85 place85 )
    ( available hoist85 )
    ( hoist-at hoist659 place659 )
    ( available hoist659 )
    ( hoist-at hoist317 place317 )
    ( available hoist317 )
    ( hoist-at hoist660 place660 )
    ( available hoist660 )
    ( hoist-at hoist638 place638 )
    ( available hoist638 )
    ( hoist-at hoist751 place751 )
    ( available hoist751 )
    ( hoist-at hoist883 place883 )
    ( available hoist883 )
    ( hoist-at hoist86 place86 )
    ( available hoist86 )
    ( hoist-at hoist827 place827 )
    ( available hoist827 )
    ( hoist-at hoist589 place589 )
    ( available hoist589 )
    ( hoist-at hoist468 place468 )
    ( available hoist468 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet356 place317 )
    ( surface-at crate356 place317 )
    ( on crate356 pallet356 )
    ( is-crate crate356 )
    ( clear crate356 )
    ( surface-at pallet172 place147 )
    ( surface-at crate172 place147 )
    ( on crate172 pallet172 )
    ( is-crate crate172 )
    ( clear crate172 )
    ( surface-at pallet217 place827 )
    ( surface-at crate217 place827 )
    ( on crate217 pallet217 )
    ( is-crate crate217 )
    ( clear crate217 )
    ( surface-at pallet855 place295 )
    ( surface-at crate855 place295 )
    ( on crate855 pallet855 )
    ( is-crate crate855 )
    ( clear crate855 )
    ( surface-at pallet320 place883 )
    ( surface-at crate320 place883 )
    ( on crate320 pallet320 )
    ( is-crate crate320 )
    ( clear crate320 )
    ( surface-at pallet367 place1 )
    ( surface-at crate367 place1 )
    ( on crate367 pallet367 )
    ( is-crate crate367 )
    ( clear crate367 )
    ( surface-at pallet319 place295 )
    ( surface-at crate319 place295 )
    ( on crate319 pallet319 )
    ( is-crate crate319 )
    ( clear crate319 )
    ( surface-at pallet999 place570 )
    ( surface-at crate999 place570 )
    ( on crate999 pallet999 )
    ( is-crate crate999 )
    ( clear crate999 )
    ( surface-at pallet164 place82 )
    ( surface-at crate164 place82 )
    ( on crate164 pallet164 )
    ( is-crate crate164 )
    ( clear crate164 )
    ( surface-at pallet6 place19 )
    ( surface-at crate6 place19 )
    ( on crate6 pallet6 )
    ( is-crate crate6 )
    ( clear crate6 )
    ( surface-at pallet432 place570 )
    ( surface-at crate432 place570 )
    ( on crate432 pallet432 )
    ( is-crate crate432 )
    ( clear crate432 )
    ( surface-at pallet720 place827 )
    ( surface-at crate720 place827 )
    ( on crate720 pallet720 )
    ( is-crate crate720 )
    ( clear crate720 )
    ( surface-at pallet804 place85 )
    ( surface-at crate804 place85 )
    ( on crate804 pallet804 )
    ( is-crate crate804 )
    ( clear crate804 )
  )
  ( :goal
    ( and
    )
  )
)
