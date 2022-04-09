( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place146 - place
    hoist146 - hoist
    place2 - place
    hoist2 - hoist
    place656 - place
    hoist656 - hoist
    place19 - place
    hoist19 - hoist
    place999 - place
    hoist999 - hoist
    place979 - place
    hoist979 - hoist
    place580 - place
    hoist580 - hoist
    place587 - place
    hoist587 - hoist
    place89 - place
    hoist89 - hoist
    place938 - place
    hoist938 - hoist
    place33 - place
    hoist33 - hoist
    place790 - place
    hoist790 - hoist
    place31 - place
    hoist31 - hoist
    place854 - place
    hoist854 - hoist
    place956 - place
    hoist956 - hoist
    place504 - place
    hoist504 - hoist
    place531 - place
    hoist531 - hoist
    place443 - place
    hoist443 - hoist
    place983 - place
    hoist983 - hoist
    place249 - place
    hoist249 - hoist
    place373 - place
    hoist373 - hoist
    place696 - place
    hoist696 - hoist
    place0 - place
    hoist0 - hoist
    crate11 - surface
    pallet11 - surface
    crate546 - surface
    pallet546 - surface
    crate599 - surface
    pallet599 - surface
    crate672 - surface
    pallet672 - surface
    crate754 - surface
    pallet754 - surface
    crate112 - surface
    pallet112 - surface
    crate256 - surface
    pallet256 - surface
    crate281 - surface
    pallet281 - surface
    crate441 - surface
    pallet441 - surface
    crate592 - surface
    pallet592 - surface
    crate678 - surface
    pallet678 - surface
    crate729 - surface
    pallet729 - surface
    crate945 - surface
    pallet945 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist146 place146 )
    ( available hoist146 )
    ( hoist-at hoist2 place2 )
    ( available hoist2 )
    ( hoist-at hoist656 place656 )
    ( available hoist656 )
    ( hoist-at hoist19 place19 )
    ( available hoist19 )
    ( hoist-at hoist999 place999 )
    ( available hoist999 )
    ( hoist-at hoist979 place979 )
    ( available hoist979 )
    ( hoist-at hoist580 place580 )
    ( available hoist580 )
    ( hoist-at hoist587 place587 )
    ( available hoist587 )
    ( hoist-at hoist89 place89 )
    ( available hoist89 )
    ( hoist-at hoist938 place938 )
    ( available hoist938 )
    ( hoist-at hoist33 place33 )
    ( available hoist33 )
    ( hoist-at hoist790 place790 )
    ( available hoist790 )
    ( hoist-at hoist31 place31 )
    ( available hoist31 )
    ( hoist-at hoist854 place854 )
    ( available hoist854 )
    ( hoist-at hoist956 place956 )
    ( available hoist956 )
    ( hoist-at hoist504 place504 )
    ( available hoist504 )
    ( hoist-at hoist531 place531 )
    ( available hoist531 )
    ( hoist-at hoist443 place443 )
    ( available hoist443 )
    ( hoist-at hoist983 place983 )
    ( available hoist983 )
    ( hoist-at hoist249 place249 )
    ( available hoist249 )
    ( hoist-at hoist373 place373 )
    ( available hoist373 )
    ( hoist-at hoist696 place696 )
    ( available hoist696 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet11 place696 )
    ( surface-at crate11 place696 )
    ( on crate11 pallet11 )
    ( is-crate crate11 )
    ( clear crate11 )
    ( surface-at pallet546 place373 )
    ( surface-at crate546 place373 )
    ( on crate546 pallet546 )
    ( is-crate crate546 )
    ( clear crate546 )
    ( surface-at pallet599 place656 )
    ( surface-at crate599 place656 )
    ( on crate599 pallet599 )
    ( is-crate crate599 )
    ( clear crate599 )
    ( surface-at pallet672 place956 )
    ( surface-at crate672 place956 )
    ( on crate672 pallet672 )
    ( is-crate crate672 )
    ( clear crate672 )
    ( surface-at pallet754 place2 )
    ( surface-at crate754 place2 )
    ( on crate754 pallet754 )
    ( is-crate crate754 )
    ( clear crate754 )
    ( surface-at pallet112 place89 )
    ( surface-at crate112 place89 )
    ( on crate112 pallet112 )
    ( is-crate crate112 )
    ( clear crate112 )
    ( surface-at pallet256 place938 )
    ( surface-at crate256 place938 )
    ( on crate256 pallet256 )
    ( is-crate crate256 )
    ( clear crate256 )
    ( surface-at pallet281 place938 )
    ( surface-at crate281 place938 )
    ( on crate281 pallet281 )
    ( is-crate crate281 )
    ( clear crate281 )
    ( surface-at pallet441 place587 )
    ( surface-at crate441 place587 )
    ( on crate441 pallet441 )
    ( is-crate crate441 )
    ( clear crate441 )
    ( surface-at pallet592 place19 )
    ( surface-at crate592 place19 )
    ( on crate592 pallet592 )
    ( is-crate crate592 )
    ( clear crate592 )
    ( surface-at pallet678 place504 )
    ( surface-at crate678 place504 )
    ( on crate678 pallet678 )
    ( is-crate crate678 )
    ( clear crate678 )
    ( surface-at pallet729 place979 )
    ( surface-at crate729 place979 )
    ( on crate729 pallet729 )
    ( is-crate crate729 )
    ( clear crate729 )
    ( surface-at pallet945 place696 )
    ( surface-at crate945 place696 )
    ( on crate945 pallet945 )
    ( is-crate crate945 )
    ( clear crate945 )
  )
  ( :tasks
    ( Make-13Crate pallet0 crate11 crate546 crate599 crate672 crate754 crate112 crate256 crate281 crate441 crate592 crate678 crate729 crate945 )
  )
)
