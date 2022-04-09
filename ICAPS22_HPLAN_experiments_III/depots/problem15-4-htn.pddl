( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place719 - place
    hoist719 - hoist
    place564 - place
    hoist564 - hoist
    place313 - place
    hoist313 - hoist
    place569 - place
    hoist569 - hoist
    place479 - place
    hoist479 - hoist
    place17 - place
    hoist17 - hoist
    place574 - place
    hoist574 - hoist
    place174 - place
    hoist174 - hoist
    place107 - place
    hoist107 - hoist
    place135 - place
    hoist135 - hoist
    place745 - place
    hoist745 - hoist
    place8 - place
    hoist8 - hoist
    place708 - place
    hoist708 - hoist
    place478 - place
    hoist478 - hoist
    place604 - place
    hoist604 - hoist
    place940 - place
    hoist940 - hoist
    place775 - place
    hoist775 - hoist
    place622 - place
    hoist622 - hoist
    place670 - place
    hoist670 - hoist
    place924 - place
    hoist924 - hoist
    place513 - place
    hoist513 - hoist
    place631 - place
    hoist631 - hoist
    place222 - place
    hoist222 - hoist
    place172 - place
    hoist172 - hoist
    place0 - place
    hoist0 - hoist
    crate686 - surface
    pallet686 - surface
    crate998 - surface
    pallet998 - surface
    crate357 - surface
    pallet357 - surface
    crate764 - surface
    pallet764 - surface
    crate374 - surface
    pallet374 - surface
    crate583 - surface
    pallet583 - surface
    crate108 - surface
    pallet108 - surface
    crate87 - surface
    pallet87 - surface
    crate950 - surface
    pallet950 - surface
    crate252 - surface
    pallet252 - surface
    crate682 - surface
    pallet682 - surface
    crate655 - surface
    pallet655 - surface
    crate599 - surface
    pallet599 - surface
    crate295 - surface
    pallet295 - surface
    crate907 - surface
    pallet907 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist719 place719 )
    ( available hoist719 )
    ( hoist-at hoist564 place564 )
    ( available hoist564 )
    ( hoist-at hoist313 place313 )
    ( available hoist313 )
    ( hoist-at hoist569 place569 )
    ( available hoist569 )
    ( hoist-at hoist479 place479 )
    ( available hoist479 )
    ( hoist-at hoist17 place17 )
    ( available hoist17 )
    ( hoist-at hoist574 place574 )
    ( available hoist574 )
    ( hoist-at hoist174 place174 )
    ( available hoist174 )
    ( hoist-at hoist107 place107 )
    ( available hoist107 )
    ( hoist-at hoist135 place135 )
    ( available hoist135 )
    ( hoist-at hoist745 place745 )
    ( available hoist745 )
    ( hoist-at hoist8 place8 )
    ( available hoist8 )
    ( hoist-at hoist708 place708 )
    ( available hoist708 )
    ( hoist-at hoist478 place478 )
    ( available hoist478 )
    ( hoist-at hoist604 place604 )
    ( available hoist604 )
    ( hoist-at hoist940 place940 )
    ( available hoist940 )
    ( hoist-at hoist775 place775 )
    ( available hoist775 )
    ( hoist-at hoist622 place622 )
    ( available hoist622 )
    ( hoist-at hoist670 place670 )
    ( available hoist670 )
    ( hoist-at hoist924 place924 )
    ( available hoist924 )
    ( hoist-at hoist513 place513 )
    ( available hoist513 )
    ( hoist-at hoist631 place631 )
    ( available hoist631 )
    ( hoist-at hoist222 place222 )
    ( available hoist222 )
    ( hoist-at hoist172 place172 )
    ( available hoist172 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet686 place17 )
    ( surface-at crate686 place17 )
    ( on crate686 pallet686 )
    ( is-crate crate686 )
    ( clear crate686 )
    ( surface-at pallet998 place622 )
    ( surface-at crate998 place622 )
    ( on crate998 pallet998 )
    ( is-crate crate998 )
    ( clear crate998 )
    ( surface-at pallet357 place222 )
    ( surface-at crate357 place222 )
    ( on crate357 pallet357 )
    ( is-crate crate357 )
    ( clear crate357 )
    ( surface-at pallet764 place924 )
    ( surface-at crate764 place924 )
    ( on crate764 pallet764 )
    ( is-crate crate764 )
    ( clear crate764 )
    ( surface-at pallet374 place622 )
    ( surface-at crate374 place622 )
    ( on crate374 pallet374 )
    ( is-crate crate374 )
    ( clear crate374 )
    ( surface-at pallet583 place174 )
    ( surface-at crate583 place174 )
    ( on crate583 pallet583 )
    ( is-crate crate583 )
    ( clear crate583 )
    ( surface-at pallet108 place719 )
    ( surface-at crate108 place719 )
    ( on crate108 pallet108 )
    ( is-crate crate108 )
    ( clear crate108 )
    ( surface-at pallet87 place313 )
    ( surface-at crate87 place313 )
    ( on crate87 pallet87 )
    ( is-crate crate87 )
    ( clear crate87 )
    ( surface-at pallet950 place631 )
    ( surface-at crate950 place631 )
    ( on crate950 pallet950 )
    ( is-crate crate950 )
    ( clear crate950 )
    ( surface-at pallet252 place174 )
    ( surface-at crate252 place174 )
    ( on crate252 pallet252 )
    ( is-crate crate252 )
    ( clear crate252 )
    ( surface-at pallet682 place940 )
    ( surface-at crate682 place940 )
    ( on crate682 pallet682 )
    ( is-crate crate682 )
    ( clear crate682 )
    ( surface-at pallet655 place479 )
    ( surface-at crate655 place479 )
    ( on crate655 pallet655 )
    ( is-crate crate655 )
    ( clear crate655 )
    ( surface-at pallet599 place222 )
    ( surface-at crate599 place222 )
    ( on crate599 pallet599 )
    ( is-crate crate599 )
    ( clear crate599 )
    ( surface-at pallet295 place775 )
    ( surface-at crate295 place775 )
    ( on crate295 pallet295 )
    ( is-crate crate295 )
    ( clear crate295 )
    ( surface-at pallet907 place719 )
    ( surface-at crate907 place719 )
    ( on crate907 pallet907 )
    ( is-crate crate907 )
    ( clear crate907 )
  )
  ( :tasks
    ( Make-15Crate pallet0 crate686 crate998 crate357 crate764 crate374 crate583 crate108 crate87 crate950 crate252 crate682 crate655 crate599 crate295 crate907 )
  )
)
