( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-875 - location
    l000-502 - location
    l000-674 - location
    l000-404 - location
    l000-756 - location
    l000-415 - location
    p953 - obj
    p827 - obj
    p174 - obj
    p660 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-875 c000 )
    ( in-city l000-502 c000 )
    ( in-city l000-674 c000 )
    ( in-city l000-404 c000 )
    ( in-city l000-756 c000 )
    ( in-city l000-415 c000 )
    ( obj-at p953 l000-756 )
    ( obj-at p827 l000-404 )
    ( obj-at p174 l000-502 )
    ( obj-at p660 l000-502 )
  )
  ( :tasks
    ( Deliver-4Pkg p953 p827 p174 p660 l000-000 )
  )
)
