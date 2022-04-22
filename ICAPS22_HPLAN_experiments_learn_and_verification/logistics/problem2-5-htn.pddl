( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-418 - location
    p954 - obj
    p391 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-418 c000 )
    ( obj-at p954 l000-418 )
    ( obj-at p391 l000-418 )
  )
  ( :tasks
    ( Deliver-2Pkg p954 p391 l000-000 )
  )
)
