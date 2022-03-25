( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-43 - location
    p685 - obj
    p134 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-43 c000 )
    ( obj-at p685 l000-43 )
    ( obj-at p134 l000-43 )
  )
  ( :tasks
    ( Deliver-2Pkg p685 p134 l000-000 )
  )
)
