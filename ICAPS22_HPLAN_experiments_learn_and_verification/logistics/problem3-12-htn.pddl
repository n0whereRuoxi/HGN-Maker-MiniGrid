( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-549 - location
    l000-485 - location
    l000-962 - location
    l000-68 - location
    p434 - obj
    p137 - obj
    p120 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-549 c000 )
    ( in-city l000-485 c000 )
    ( in-city l000-962 c000 )
    ( in-city l000-68 c000 )
    ( obj-at p434 l000-68 )
    ( obj-at p137 l000-549 )
    ( obj-at p120 l000-485 )
  )
  ( :tasks
    ( Deliver-3Pkg p434 p137 p120 l000-000 )
  )
)
