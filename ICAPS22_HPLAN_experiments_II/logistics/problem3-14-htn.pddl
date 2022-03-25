( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-311 - location
    l000-337 - location
    l000-548 - location
    l000-101 - location
    l000-502 - location
    p351 - obj
    p916 - obj
    p107 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-311 c000 )
    ( in-city l000-337 c000 )
    ( in-city l000-548 c000 )
    ( in-city l000-101 c000 )
    ( in-city l000-502 c000 )
    ( obj-at p351 l000-337 )
    ( obj-at p916 l000-101 )
    ( obj-at p107 l000-548 )
  )
  ( :tasks
    ( Deliver-3Pkg p351 p916 p107 l000-000 )
  )
)
