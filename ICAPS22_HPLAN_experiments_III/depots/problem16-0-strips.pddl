( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place382 - place
    hoist382 - hoist
    place177 - place
    hoist177 - hoist
    place613 - place
    hoist613 - hoist
    place660 - place
    hoist660 - hoist
    place882 - place
    hoist882 - hoist
    place890 - place
    hoist890 - hoist
    place563 - place
    hoist563 - hoist
    place634 - place
    hoist634 - hoist
    place696 - place
    hoist696 - hoist
    place220 - place
    hoist220 - hoist
    place444 - place
    hoist444 - hoist
    place169 - place
    hoist169 - hoist
    place0 - place
    hoist0 - hoist
    crate530 - surface
    pallet530 - surface
    crate801 - surface
    pallet801 - surface
    crate133 - surface
    pallet133 - surface
    crate924 - surface
    pallet924 - surface
    crate246 - surface
    pallet246 - surface
    crate511 - surface
    pallet511 - surface
    crate26 - surface
    pallet26 - surface
    crate681 - surface
    pallet681 - surface
    crate615 - surface
    pallet615 - surface
    crate636 - surface
    pallet636 - surface
    crate724 - surface
    pallet724 - surface
    crate754 - surface
    pallet754 - surface
    crate935 - surface
    pallet935 - surface
    crate315 - surface
    pallet315 - surface
    crate115 - surface
    pallet115 - surface
    crate241 - surface
    pallet241 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist382 place382 )
    ( available hoist382 )
    ( hoist-at hoist177 place177 )
    ( available hoist177 )
    ( hoist-at hoist613 place613 )
    ( available hoist613 )
    ( hoist-at hoist660 place660 )
    ( available hoist660 )
    ( hoist-at hoist882 place882 )
    ( available hoist882 )
    ( hoist-at hoist890 place890 )
    ( available hoist890 )
    ( hoist-at hoist563 place563 )
    ( available hoist563 )
    ( hoist-at hoist634 place634 )
    ( available hoist634 )
    ( hoist-at hoist696 place696 )
    ( available hoist696 )
    ( hoist-at hoist220 place220 )
    ( available hoist220 )
    ( hoist-at hoist444 place444 )
    ( available hoist444 )
    ( hoist-at hoist169 place169 )
    ( available hoist169 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet530 place660 )
    ( surface-at crate530 place660 )
    ( on crate530 pallet530 )
    ( is-crate crate530 )
    ( clear crate530 )
    ( surface-at pallet801 place444 )
    ( surface-at crate801 place444 )
    ( on crate801 pallet801 )
    ( is-crate crate801 )
    ( clear crate801 )
    ( surface-at pallet133 place696 )
    ( surface-at crate133 place696 )
    ( on crate133 pallet133 )
    ( is-crate crate133 )
    ( clear crate133 )
    ( surface-at pallet924 place882 )
    ( surface-at crate924 place882 )
    ( on crate924 pallet924 )
    ( is-crate crate924 )
    ( clear crate924 )
    ( surface-at pallet246 place696 )
    ( surface-at crate246 place696 )
    ( on crate246 pallet246 )
    ( is-crate crate246 )
    ( clear crate246 )
    ( surface-at pallet511 place220 )
    ( surface-at crate511 place220 )
    ( on crate511 pallet511 )
    ( is-crate crate511 )
    ( clear crate511 )
    ( surface-at pallet26 place444 )
    ( surface-at crate26 place444 )
    ( on crate26 pallet26 )
    ( is-crate crate26 )
    ( clear crate26 )
    ( surface-at pallet681 place220 )
    ( surface-at crate681 place220 )
    ( on crate681 pallet681 )
    ( is-crate crate681 )
    ( clear crate681 )
    ( surface-at pallet615 place882 )
    ( surface-at crate615 place882 )
    ( on crate615 pallet615 )
    ( is-crate crate615 )
    ( clear crate615 )
    ( surface-at pallet636 place634 )
    ( surface-at crate636 place634 )
    ( on crate636 pallet636 )
    ( is-crate crate636 )
    ( clear crate636 )
    ( surface-at pallet724 place444 )
    ( surface-at crate724 place444 )
    ( on crate724 pallet724 )
    ( is-crate crate724 )
    ( clear crate724 )
    ( surface-at pallet754 place613 )
    ( surface-at crate754 place613 )
    ( on crate754 pallet754 )
    ( is-crate crate754 )
    ( clear crate754 )
    ( surface-at pallet935 place882 )
    ( surface-at crate935 place882 )
    ( on crate935 pallet935 )
    ( is-crate crate935 )
    ( clear crate935 )
    ( surface-at pallet315 place882 )
    ( surface-at crate315 place882 )
    ( on crate315 pallet315 )
    ( is-crate crate315 )
    ( clear crate315 )
    ( surface-at pallet115 place444 )
    ( surface-at crate115 place444 )
    ( on crate115 pallet115 )
    ( is-crate crate115 )
    ( clear crate115 )
    ( surface-at pallet241 place444 )
    ( surface-at crate241 place444 )
    ( on crate241 pallet241 )
    ( is-crate crate241 )
    ( clear crate241 )
  )
  ( :goal
    ( and
    )
  )
)
