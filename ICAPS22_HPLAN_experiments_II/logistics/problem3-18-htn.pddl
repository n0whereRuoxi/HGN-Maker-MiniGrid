( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-868 - location
    l000-596 - location
    l000-237 - location
    l000-791 - location
    l000-36 - location
    l000-800 - location
    p340 - obj
    p829 - obj
    p574 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-868 c000 )
    ( in-city l000-596 c000 )
    ( in-city l000-237 c000 )
    ( in-city l000-791 c000 )
    ( in-city l000-36 c000 )
    ( in-city l000-800 c000 )
    ( obj-at p340 l000-36 )
    ( obj-at p829 l000-237 )
    ( obj-at p574 l000-596 )
  )
  ( :tasks
    ( Deliver-3Pkg p340 p829 p574 l000-000 )
  )
)
