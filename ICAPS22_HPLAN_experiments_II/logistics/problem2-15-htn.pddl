( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-944 - location
    l000-302 - location
    l000-305 - location
    p836 - obj
    p678 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-944 c000 )
    ( in-city l000-302 c000 )
    ( in-city l000-305 c000 )
    ( obj-at p836 l000-302 )
    ( obj-at p678 l000-302 )
  )
  ( :tasks
    ( Deliver-2Pkg p836 p678 l000-000 )
  )
)
