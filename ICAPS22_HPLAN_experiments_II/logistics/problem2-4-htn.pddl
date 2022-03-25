( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-278 - location
    l000-21 - location
    l000-825 - location
    l000-877 - location
    p267 - obj
    p118 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-278 c000 )
    ( in-city l000-21 c000 )
    ( in-city l000-825 c000 )
    ( in-city l000-877 c000 )
    ( obj-at p267 l000-21 )
    ( obj-at p118 l000-278 )
  )
  ( :tasks
    ( Deliver-2Pkg p267 p118 l000-000 )
  )
)
