( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-817 - location
    l000-370 - location
    p334 - obj
    p903 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-817 c000 )
    ( in-city l000-370 c000 )
    ( obj-at p334 l000-370 )
    ( obj-at p903 l000-817 )
  )
  ( :tasks
    ( Deliver-2Pkg p334 p903 l000-000 )
  )
)
