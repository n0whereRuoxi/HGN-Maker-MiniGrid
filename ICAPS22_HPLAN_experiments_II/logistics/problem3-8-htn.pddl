( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-702 - location
    l000-20 - location
    l000-36 - location
    l000-458 - location
    l000-847 - location
    p295 - obj
    p998 - obj
    p269 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-702 c000 )
    ( in-city l000-20 c000 )
    ( in-city l000-36 c000 )
    ( in-city l000-458 c000 )
    ( in-city l000-847 c000 )
    ( obj-at p295 l000-20 )
    ( obj-at p998 l000-458 )
    ( obj-at p269 l000-20 )
  )
  ( :tasks
    ( Deliver-3Pkg p295 p998 p269 l000-000 )
  )
)
