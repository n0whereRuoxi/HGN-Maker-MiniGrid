( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-53 - location
    l000-285 - location
    p725 - obj
    p138 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-53 c000 )
    ( in-city l000-285 c000 )
    ( obj-at p725 l000-53 )
    ( obj-at p138 l000-53 )
  )
  ( :tasks
    ( Deliver-2Pkg p725 p138 l000-000 )
  )
)
