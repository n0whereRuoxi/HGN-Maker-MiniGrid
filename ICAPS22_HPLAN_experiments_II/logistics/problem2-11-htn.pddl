( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-759 - location
    p135 - obj
    p213 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-759 c000 )
    ( obj-at p135 l000-759 )
    ( obj-at p213 l000-759 )
  )
  ( :tasks
    ( Deliver-2Pkg p135 p213 l000-000 )
  )
)
