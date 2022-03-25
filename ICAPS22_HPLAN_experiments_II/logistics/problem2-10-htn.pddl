( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-854 - location
    l000-592 - location
    l000-468 - location
    p670 - obj
    p871 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-854 c000 )
    ( in-city l000-592 c000 )
    ( in-city l000-468 c000 )
    ( obj-at p670 l000-854 )
    ( obj-at p871 l000-592 )
  )
  ( :tasks
    ( Deliver-2Pkg p670 p871 l000-000 )
  )
)
