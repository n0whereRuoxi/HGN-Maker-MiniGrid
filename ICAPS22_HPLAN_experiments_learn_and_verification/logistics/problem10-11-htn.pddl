( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-566 - location
    l000-478 - location
    l000-606 - location
    l000-640 - location
    l000-896 - location
    l000-808 - location
    l000-651 - location
    l000-393 - location
    l000-573 - location
    l000-830 - location
    l000-9 - location
    l000-75 - location
    l000-942 - location
    l000-477 - location
    l000-172 - location
    l000-280 - location
    l000-620 - location
    l000-993 - location
    l000-746 - location
    l000-473 - location
    p137 - obj
    p131 - obj
    p210 - obj
    p462 - obj
    p682 - obj
    p120 - obj
    p613 - obj
    p542 - obj
    p921 - obj
    p8 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-566 c000 )
    ( in-city l000-478 c000 )
    ( in-city l000-606 c000 )
    ( in-city l000-640 c000 )
    ( in-city l000-896 c000 )
    ( in-city l000-808 c000 )
    ( in-city l000-651 c000 )
    ( in-city l000-393 c000 )
    ( in-city l000-573 c000 )
    ( in-city l000-830 c000 )
    ( in-city l000-9 c000 )
    ( in-city l000-75 c000 )
    ( in-city l000-942 c000 )
    ( in-city l000-477 c000 )
    ( in-city l000-172 c000 )
    ( in-city l000-280 c000 )
    ( in-city l000-620 c000 )
    ( in-city l000-993 c000 )
    ( in-city l000-746 c000 )
    ( in-city l000-473 c000 )
    ( obj-at p137 l000-651 )
    ( obj-at p131 l000-473 )
    ( obj-at p210 l000-651 )
    ( obj-at p462 l000-808 )
    ( obj-at p682 l000-477 )
    ( obj-at p120 l000-808 )
    ( obj-at p613 l000-9 )
    ( obj-at p542 l000-620 )
    ( obj-at p921 l000-993 )
    ( obj-at p8 l000-640 )
  )
  ( :tasks
    ( Deliver-10Pkg p137 p131 p210 p462 p682 p120 p613 p542 p921 p8 l000-000 )
  )
)
