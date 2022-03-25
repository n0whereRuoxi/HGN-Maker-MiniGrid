( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-24 - location
    l000-800 - location
    p255 - obj
    p29 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-24 c000 )
    ( in-city l000-800 c000 )
    ( obj-at p255 l000-800 )
    ( obj-at p29 l000-24 )
  )
  ( :tasks
    ( Deliver-2Pkg p255 p29 l000-000 )
  )
)
