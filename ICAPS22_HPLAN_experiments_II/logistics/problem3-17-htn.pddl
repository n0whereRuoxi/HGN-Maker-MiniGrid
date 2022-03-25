( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-366 - location
    l000-168 - location
    l000-350 - location
    l000-985 - location
    l000-63 - location
    l000-449 - location
    p643 - obj
    p735 - obj
    p659 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-366 c000 )
    ( in-city l000-168 c000 )
    ( in-city l000-350 c000 )
    ( in-city l000-985 c000 )
    ( in-city l000-63 c000 )
    ( in-city l000-449 c000 )
    ( obj-at p643 l000-168 )
    ( obj-at p735 l000-63 )
    ( obj-at p659 l000-350 )
  )
  ( :tasks
    ( Deliver-3Pkg p643 p735 p659 l000-000 )
  )
)
