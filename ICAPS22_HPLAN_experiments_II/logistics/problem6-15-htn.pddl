( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-12 - location
    l000-862 - location
    l000-942 - location
    l000-602 - location
    l000-598 - location
    p92 - obj
    p724 - obj
    p925 - obj
    p942 - obj
    p31 - obj
    p633 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-12 c000 )
    ( in-city l000-862 c000 )
    ( in-city l000-942 c000 )
    ( in-city l000-602 c000 )
    ( in-city l000-598 c000 )
    ( obj-at p92 l000-12 )
    ( obj-at p724 l000-602 )
    ( obj-at p925 l000-602 )
    ( obj-at p942 l000-12 )
    ( obj-at p31 l000-12 )
    ( obj-at p633 l000-598 )
  )
  ( :tasks
    ( Deliver-6Pkg p92 p724 p925 p942 p31 p633 l000-000 )
  )
)
