( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place542 - place
    hoist542 - hoist
    place452 - place
    hoist452 - hoist
    place221 - place
    hoist221 - hoist
    place421 - place
    hoist421 - hoist
    place593 - place
    hoist593 - hoist
    place503 - place
    hoist503 - hoist
    place808 - place
    hoist808 - hoist
    place754 - place
    hoist754 - hoist
    place810 - place
    hoist810 - hoist
    place629 - place
    hoist629 - hoist
    place567 - place
    hoist567 - hoist
    place894 - place
    hoist894 - hoist
    place640 - place
    hoist640 - hoist
    place30 - place
    hoist30 - hoist
    place306 - place
    hoist306 - hoist
    place49 - place
    hoist49 - hoist
    place862 - place
    hoist862 - hoist
    place0 - place
    hoist0 - hoist
    crate505 - surface
    pallet505 - surface
    crate597 - surface
    pallet597 - surface
    crate341 - surface
    pallet341 - surface
    crate800 - surface
    pallet800 - surface
    crate867 - surface
    pallet867 - surface
    crate96 - surface
    pallet96 - surface
    crate203 - surface
    pallet203 - surface
    crate149 - surface
    pallet149 - surface
    crate665 - surface
    pallet665 - surface
    crate628 - surface
    pallet628 - surface
    crate608 - surface
    pallet608 - surface
    crate555 - surface
    pallet555 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist542 place542 )
    ( available hoist542 )
    ( hoist-at hoist452 place452 )
    ( available hoist452 )
    ( hoist-at hoist221 place221 )
    ( available hoist221 )
    ( hoist-at hoist421 place421 )
    ( available hoist421 )
    ( hoist-at hoist593 place593 )
    ( available hoist593 )
    ( hoist-at hoist503 place503 )
    ( available hoist503 )
    ( hoist-at hoist808 place808 )
    ( available hoist808 )
    ( hoist-at hoist754 place754 )
    ( available hoist754 )
    ( hoist-at hoist810 place810 )
    ( available hoist810 )
    ( hoist-at hoist629 place629 )
    ( available hoist629 )
    ( hoist-at hoist567 place567 )
    ( available hoist567 )
    ( hoist-at hoist894 place894 )
    ( available hoist894 )
    ( hoist-at hoist640 place640 )
    ( available hoist640 )
    ( hoist-at hoist30 place30 )
    ( available hoist30 )
    ( hoist-at hoist306 place306 )
    ( available hoist306 )
    ( hoist-at hoist49 place49 )
    ( available hoist49 )
    ( hoist-at hoist862 place862 )
    ( available hoist862 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet505 place221 )
    ( surface-at crate505 place221 )
    ( on crate505 pallet505 )
    ( is-crate crate505 )
    ( clear crate505 )
    ( surface-at pallet597 place421 )
    ( surface-at crate597 place421 )
    ( on crate597 pallet597 )
    ( is-crate crate597 )
    ( clear crate597 )
    ( surface-at pallet341 place542 )
    ( surface-at crate341 place542 )
    ( on crate341 pallet341 )
    ( is-crate crate341 )
    ( clear crate341 )
    ( surface-at pallet800 place30 )
    ( surface-at crate800 place30 )
    ( on crate800 pallet800 )
    ( is-crate crate800 )
    ( clear crate800 )
    ( surface-at pallet867 place862 )
    ( surface-at crate867 place862 )
    ( on crate867 pallet867 )
    ( is-crate crate867 )
    ( clear crate867 )
    ( surface-at pallet96 place306 )
    ( surface-at crate96 place306 )
    ( on crate96 pallet96 )
    ( is-crate crate96 )
    ( clear crate96 )
    ( surface-at pallet203 place49 )
    ( surface-at crate203 place49 )
    ( on crate203 pallet203 )
    ( is-crate crate203 )
    ( clear crate203 )
    ( surface-at pallet149 place503 )
    ( surface-at crate149 place503 )
    ( on crate149 pallet149 )
    ( is-crate crate149 )
    ( clear crate149 )
    ( surface-at pallet665 place862 )
    ( surface-at crate665 place862 )
    ( on crate665 pallet665 )
    ( is-crate crate665 )
    ( clear crate665 )
    ( surface-at pallet628 place542 )
    ( surface-at crate628 place542 )
    ( on crate628 pallet628 )
    ( is-crate crate628 )
    ( clear crate628 )
    ( surface-at pallet608 place640 )
    ( surface-at crate608 place640 )
    ( on crate608 pallet608 )
    ( is-crate crate608 )
    ( clear crate608 )
    ( surface-at pallet555 place640 )
    ( surface-at crate555 place640 )
    ( on crate555 pallet555 )
    ( is-crate crate555 )
    ( clear crate555 )
  )
  ( :goal
    ( and
    )
  )
)
