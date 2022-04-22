( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-344 - location
    l000-753 - location
    l000-661 - location
    l000-450 - location
    l000-138 - location
    l000-535 - location
    l000-738 - location
    l000-191 - location
    l000-10 - location
    l000-324 - location
    l000-482 - location
    l000-576 - location
    l000-150 - location
    l000-820 - location
    l000-46 - location
    p329 - obj
    p399 - obj
    p862 - obj
    p879 - obj
    p904 - obj
    p475 - obj
    p817 - obj
    p540 - obj
    p175 - obj
    p456 - obj
    p267 - obj
    p49 - obj
    p911 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-344 c000 )
    ( in-city l000-753 c000 )
    ( in-city l000-661 c000 )
    ( in-city l000-450 c000 )
    ( in-city l000-138 c000 )
    ( in-city l000-535 c000 )
    ( in-city l000-738 c000 )
    ( in-city l000-191 c000 )
    ( in-city l000-10 c000 )
    ( in-city l000-324 c000 )
    ( in-city l000-482 c000 )
    ( in-city l000-576 c000 )
    ( in-city l000-150 c000 )
    ( in-city l000-820 c000 )
    ( in-city l000-46 c000 )
    ( obj-at p329 l000-344 )
    ( obj-at p399 l000-10 )
    ( obj-at p862 l000-576 )
    ( obj-at p879 l000-535 )
    ( obj-at p904 l000-535 )
    ( obj-at p475 l000-46 )
    ( obj-at p817 l000-576 )
    ( obj-at p540 l000-150 )
    ( obj-at p175 l000-150 )
    ( obj-at p456 l000-753 )
    ( obj-at p267 l000-576 )
    ( obj-at p49 l000-46 )
    ( obj-at p911 l000-10 )
  )
  ( :tasks
    ( Deliver-13Pkg p329 p399 p862 p879 p904 p475 p817 p540 p175 p456 p267 p49 p911 l000-000 )
  )
)
