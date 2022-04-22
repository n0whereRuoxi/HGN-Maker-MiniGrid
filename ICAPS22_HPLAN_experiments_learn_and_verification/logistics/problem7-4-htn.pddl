( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-677 - location
    l000-988 - location
    l000-211 - location
    l000-315 - location
    p334 - obj
    p107 - obj
    p400 - obj
    p14 - obj
    p361 - obj
    p320 - obj
    p248 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-677 c000 )
    ( in-city l000-988 c000 )
    ( in-city l000-211 c000 )
    ( in-city l000-315 c000 )
    ( obj-at p334 l000-211 )
    ( obj-at p107 l000-677 )
    ( obj-at p400 l000-677 )
    ( obj-at p14 l000-677 )
    ( obj-at p361 l000-315 )
    ( obj-at p320 l000-677 )
    ( obj-at p248 l000-211 )
  )
  ( :tasks
    ( Deliver-7Pkg p334 p107 p400 p14 p361 p320 p248 l000-000 )
  )
)
