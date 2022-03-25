( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-795 - location
    l000-604 - location
    l000-742 - location
    l000-390 - location
    l000-449 - location
    l000-392 - location
    l000-649 - location
    p632 - obj
    p991 - obj
    p43 - obj
    p545 - obj
    p544 - obj
    p724 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-795 c000 )
    ( in-city l000-604 c000 )
    ( in-city l000-742 c000 )
    ( in-city l000-390 c000 )
    ( in-city l000-449 c000 )
    ( in-city l000-392 c000 )
    ( in-city l000-649 c000 )
    ( obj-at p632 l000-742 )
    ( obj-at p991 l000-390 )
    ( obj-at p43 l000-742 )
    ( obj-at p545 l000-649 )
    ( obj-at p544 l000-604 )
    ( obj-at p724 l000-795 )
  )
  ( :tasks
    ( Deliver-6Pkg p632 p991 p43 p545 p544 p724 l000-000 )
  )
)
