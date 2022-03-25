( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-438 - location
    l000-197 - location
    l000-940 - location
    l000-858 - location
    p884 - obj
    p632 - obj
    p655 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-438 c000 )
    ( in-city l000-197 c000 )
    ( in-city l000-940 c000 )
    ( in-city l000-858 c000 )
    ( obj-at p884 l000-197 )
    ( obj-at p632 l000-858 )
    ( obj-at p655 l000-940 )
  )
  ( :tasks
    ( Deliver-3Pkg p884 p632 p655 l000-000 )
  )
)
