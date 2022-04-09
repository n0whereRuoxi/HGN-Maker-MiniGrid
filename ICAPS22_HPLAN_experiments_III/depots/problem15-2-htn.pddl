( define ( htn-problem probname )
  ( :domain depots )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place561 - place
    hoist561 - hoist
    place653 - place
    hoist653 - hoist
    place171 - place
    hoist171 - hoist
    place235 - place
    hoist235 - hoist
    place63 - place
    hoist63 - hoist
    place635 - place
    hoist635 - hoist
    place472 - place
    hoist472 - hoist
    place513 - place
    hoist513 - hoist
    place685 - place
    hoist685 - hoist
    place633 - place
    hoist633 - hoist
    place101 - place
    hoist101 - hoist
    place129 - place
    hoist129 - hoist
    place423 - place
    hoist423 - hoist
    place22 - place
    hoist22 - hoist
    place338 - place
    hoist338 - hoist
    place703 - place
    hoist703 - hoist
    place836 - place
    hoist836 - hoist
    place270 - place
    hoist270 - hoist
    place578 - place
    hoist578 - hoist
    place351 - place
    hoist351 - hoist
    place875 - place
    hoist875 - hoist
    place634 - place
    hoist634 - hoist
    place368 - place
    hoist368 - hoist
    place799 - place
    hoist799 - hoist
    place851 - place
    hoist851 - hoist
    place798 - place
    hoist798 - hoist
    place178 - place
    hoist178 - hoist
    place641 - place
    hoist641 - hoist
    place369 - place
    hoist369 - hoist
    place0 - place
    hoist0 - hoist
    crate685 - surface
    pallet685 - surface
    crate559 - surface
    pallet559 - surface
    crate292 - surface
    pallet292 - surface
    crate718 - surface
    pallet718 - surface
    crate150 - surface
    pallet150 - surface
    crate299 - surface
    pallet299 - surface
    crate175 - surface
    pallet175 - surface
    crate547 - surface
    pallet547 - surface
    crate221 - surface
    pallet221 - surface
    crate887 - surface
    pallet887 - surface
    crate774 - surface
    pallet774 - surface
    crate758 - surface
    pallet758 - surface
    crate764 - surface
    pallet764 - surface
    crate688 - surface
    pallet688 - surface
    crate37 - surface
    pallet37 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist561 place561 )
    ( available hoist561 )
    ( hoist-at hoist653 place653 )
    ( available hoist653 )
    ( hoist-at hoist171 place171 )
    ( available hoist171 )
    ( hoist-at hoist235 place235 )
    ( available hoist235 )
    ( hoist-at hoist63 place63 )
    ( available hoist63 )
    ( hoist-at hoist635 place635 )
    ( available hoist635 )
    ( hoist-at hoist472 place472 )
    ( available hoist472 )
    ( hoist-at hoist513 place513 )
    ( available hoist513 )
    ( hoist-at hoist685 place685 )
    ( available hoist685 )
    ( hoist-at hoist633 place633 )
    ( available hoist633 )
    ( hoist-at hoist101 place101 )
    ( available hoist101 )
    ( hoist-at hoist129 place129 )
    ( available hoist129 )
    ( hoist-at hoist423 place423 )
    ( available hoist423 )
    ( hoist-at hoist22 place22 )
    ( available hoist22 )
    ( hoist-at hoist338 place338 )
    ( available hoist338 )
    ( hoist-at hoist703 place703 )
    ( available hoist703 )
    ( hoist-at hoist836 place836 )
    ( available hoist836 )
    ( hoist-at hoist270 place270 )
    ( available hoist270 )
    ( hoist-at hoist578 place578 )
    ( available hoist578 )
    ( hoist-at hoist351 place351 )
    ( available hoist351 )
    ( hoist-at hoist875 place875 )
    ( available hoist875 )
    ( hoist-at hoist634 place634 )
    ( available hoist634 )
    ( hoist-at hoist368 place368 )
    ( available hoist368 )
    ( hoist-at hoist799 place799 )
    ( available hoist799 )
    ( hoist-at hoist851 place851 )
    ( available hoist851 )
    ( hoist-at hoist798 place798 )
    ( available hoist798 )
    ( hoist-at hoist178 place178 )
    ( available hoist178 )
    ( hoist-at hoist641 place641 )
    ( available hoist641 )
    ( hoist-at hoist369 place369 )
    ( available hoist369 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet685 place270 )
    ( surface-at crate685 place270 )
    ( on crate685 pallet685 )
    ( is-crate crate685 )
    ( clear crate685 )
    ( surface-at pallet559 place22 )
    ( surface-at crate559 place22 )
    ( on crate559 pallet559 )
    ( is-crate crate559 )
    ( clear crate559 )
    ( surface-at pallet292 place63 )
    ( surface-at crate292 place63 )
    ( on crate292 pallet292 )
    ( is-crate crate292 )
    ( clear crate292 )
    ( surface-at pallet718 place338 )
    ( surface-at crate718 place338 )
    ( on crate718 pallet718 )
    ( is-crate crate718 )
    ( clear crate718 )
    ( surface-at pallet150 place875 )
    ( surface-at crate150 place875 )
    ( on crate150 pallet150 )
    ( is-crate crate150 )
    ( clear crate150 )
    ( surface-at pallet299 place633 )
    ( surface-at crate299 place633 )
    ( on crate299 pallet299 )
    ( is-crate crate299 )
    ( clear crate299 )
    ( surface-at pallet175 place578 )
    ( surface-at crate175 place578 )
    ( on crate175 pallet175 )
    ( is-crate crate175 )
    ( clear crate175 )
    ( surface-at pallet547 place799 )
    ( surface-at crate547 place799 )
    ( on crate547 pallet547 )
    ( is-crate crate547 )
    ( clear crate547 )
    ( surface-at pallet221 place270 )
    ( surface-at crate221 place270 )
    ( on crate221 pallet221 )
    ( is-crate crate221 )
    ( clear crate221 )
    ( surface-at pallet887 place63 )
    ( surface-at crate887 place63 )
    ( on crate887 pallet887 )
    ( is-crate crate887 )
    ( clear crate887 )
    ( surface-at pallet774 place22 )
    ( surface-at crate774 place22 )
    ( on crate774 pallet774 )
    ( is-crate crate774 )
    ( clear crate774 )
    ( surface-at pallet758 place875 )
    ( surface-at crate758 place875 )
    ( on crate758 pallet758 )
    ( is-crate crate758 )
    ( clear crate758 )
    ( surface-at pallet764 place235 )
    ( surface-at crate764 place235 )
    ( on crate764 pallet764 )
    ( is-crate crate764 )
    ( clear crate764 )
    ( surface-at pallet688 place836 )
    ( surface-at crate688 place836 )
    ( on crate688 pallet688 )
    ( is-crate crate688 )
    ( clear crate688 )
    ( surface-at pallet37 place369 )
    ( surface-at crate37 place369 )
    ( on crate37 pallet37 )
    ( is-crate crate37 )
    ( clear crate37 )
  )
  ( :tasks
    ( Make-15Crate crate685 crate559 crate292 crate718 crate150 crate299 crate175 crate547 crate221 crate887 crate774 crate758 crate764 crate688 crate37 l000 )
  )
)
