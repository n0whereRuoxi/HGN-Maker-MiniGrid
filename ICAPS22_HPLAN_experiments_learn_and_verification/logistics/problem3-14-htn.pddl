( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-218 - location
    l000-915 - location
    l000-133 - location
    p945 - obj
    p599 - obj
    p588 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-218 c000 )
    ( in-city l000-915 c000 )
    ( in-city l000-133 c000 )
    ( obj-at p945 l000-915 )
    ( obj-at p599 l000-133 )
    ( obj-at p588 l000-915 )
  )
  ( :tasks
    ( Deliver-3Pkg p945 p599 p588 l000-000 )
  )
)
