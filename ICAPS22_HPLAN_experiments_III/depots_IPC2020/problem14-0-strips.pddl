( define ( problem probname )
  ( :domain depots )
  ( :requirements :strips :typing :equality )
  ( :objects
    truck0 - truck
    pallet0 - surface
    place829 - place
    hoist829 - hoist
    place856 - place
    hoist856 - hoist
    place356 - place
    hoist356 - hoist
    place682 - place
    hoist682 - hoist
    place950 - place
    hoist950 - hoist
    place9 - place
    hoist9 - hoist
    place862 - place
    hoist862 - hoist
    place234 - place
    hoist234 - hoist
    place324 - place
    hoist324 - hoist
    place678 - place
    hoist678 - hoist
    place323 - place
    hoist323 - hoist
    place225 - place
    hoist225 - hoist
    place978 - place
    hoist978 - hoist
    place913 - place
    hoist913 - hoist
    place638 - place
    hoist638 - hoist
    place11 - place
    hoist11 - hoist
    place912 - place
    hoist912 - hoist
    place904 - place
    hoist904 - hoist
    place917 - place
    hoist917 - hoist
    place707 - place
    hoist707 - hoist
    place63 - place
    hoist63 - hoist
    place538 - place
    hoist538 - hoist
    place235 - place
    hoist235 - hoist
    place930 - place
    hoist930 - hoist
    place660 - place
    hoist660 - hoist
    place244 - place
    hoist244 - hoist
    place0 - place
    hoist0 - hoist
    crate456 - surface
    pallet456 - surface
    crate720 - surface
    pallet720 - surface
    crate753 - surface
    pallet753 - surface
    crate791 - surface
    pallet791 - surface
    crate589 - surface
    pallet589 - surface
    crate283 - surface
    pallet283 - surface
    crate536 - surface
    pallet536 - surface
    crate645 - surface
    pallet645 - surface
    crate879 - surface
    pallet879 - surface
    crate572 - surface
    pallet572 - surface
    crate988 - surface
    pallet988 - surface
    crate198 - surface
    pallet198 - surface
    crate345 - surface
    pallet345 - surface
    crate769 - surface
    pallet769 - surface
  )
  ( :init
    ( truck-at truck0 place0 )
    ( surface-at pallet0 place0 )
    ( clear pallet0 )
    ( hoist-at hoist829 place829 )
    ( available hoist829 )
    ( hoist-at hoist856 place856 )
    ( available hoist856 )
    ( hoist-at hoist356 place356 )
    ( available hoist356 )
    ( hoist-at hoist682 place682 )
    ( available hoist682 )
    ( hoist-at hoist950 place950 )
    ( available hoist950 )
    ( hoist-at hoist9 place9 )
    ( available hoist9 )
    ( hoist-at hoist862 place862 )
    ( available hoist862 )
    ( hoist-at hoist234 place234 )
    ( available hoist234 )
    ( hoist-at hoist324 place324 )
    ( available hoist324 )
    ( hoist-at hoist678 place678 )
    ( available hoist678 )
    ( hoist-at hoist323 place323 )
    ( available hoist323 )
    ( hoist-at hoist225 place225 )
    ( available hoist225 )
    ( hoist-at hoist978 place978 )
    ( available hoist978 )
    ( hoist-at hoist913 place913 )
    ( available hoist913 )
    ( hoist-at hoist638 place638 )
    ( available hoist638 )
    ( hoist-at hoist11 place11 )
    ( available hoist11 )
    ( hoist-at hoist912 place912 )
    ( available hoist912 )
    ( hoist-at hoist904 place904 )
    ( available hoist904 )
    ( hoist-at hoist917 place917 )
    ( available hoist917 )
    ( hoist-at hoist707 place707 )
    ( available hoist707 )
    ( hoist-at hoist63 place63 )
    ( available hoist63 )
    ( hoist-at hoist538 place538 )
    ( available hoist538 )
    ( hoist-at hoist235 place235 )
    ( available hoist235 )
    ( hoist-at hoist930 place930 )
    ( available hoist930 )
    ( hoist-at hoist660 place660 )
    ( available hoist660 )
    ( hoist-at hoist244 place244 )
    ( available hoist244 )
    ( hoist-at hoist0 place0 )
    ( available hoist0 )
    ( surface-at pallet456 place707 )
    ( surface-at crate456 place707 )
    ( on crate456 pallet456 )
    ( is-crate crate456 )
    ( clear crate456 )
    ( surface-at pallet720 place930 )
    ( surface-at crate720 place930 )
    ( on crate720 pallet720 )
    ( is-crate crate720 )
    ( clear crate720 )
    ( surface-at pallet753 place244 )
    ( surface-at crate753 place244 )
    ( on crate753 pallet753 )
    ( is-crate crate753 )
    ( clear crate753 )
    ( surface-at pallet791 place682 )
    ( surface-at crate791 place682 )
    ( on crate791 pallet791 )
    ( is-crate crate791 )
    ( clear crate791 )
    ( surface-at pallet589 place234 )
    ( surface-at crate589 place234 )
    ( on crate589 pallet589 )
    ( is-crate crate589 )
    ( clear crate589 )
    ( surface-at pallet283 place862 )
    ( surface-at crate283 place862 )
    ( on crate283 pallet283 )
    ( is-crate crate283 )
    ( clear crate283 )
    ( surface-at pallet536 place324 )
    ( surface-at crate536 place324 )
    ( on crate536 pallet536 )
    ( is-crate crate536 )
    ( clear crate536 )
    ( surface-at pallet645 place244 )
    ( surface-at crate645 place244 )
    ( on crate645 pallet645 )
    ( is-crate crate645 )
    ( clear crate645 )
    ( surface-at pallet879 place678 )
    ( surface-at crate879 place678 )
    ( on crate879 pallet879 )
    ( is-crate crate879 )
    ( clear crate879 )
    ( surface-at pallet572 place856 )
    ( surface-at crate572 place856 )
    ( on crate572 pallet572 )
    ( is-crate crate572 )
    ( clear crate572 )
    ( surface-at pallet988 place538 )
    ( surface-at crate988 place538 )
    ( on crate988 pallet988 )
    ( is-crate crate988 )
    ( clear crate988 )
    ( surface-at pallet198 place829 )
    ( surface-at crate198 place829 )
    ( on crate198 pallet198 )
    ( is-crate crate198 )
    ( clear crate198 )
    ( surface-at pallet345 place235 )
    ( surface-at crate345 place235 )
    ( on crate345 pallet345 )
    ( is-crate crate345 )
    ( clear crate345 )
    ( surface-at pallet769 place225 )
    ( surface-at crate769 place225 )
    ( on crate769 pallet769 )
    ( is-crate crate769 )
    ( clear crate769 )
  )
  ( :goal
    ( and
    )
  )
)
