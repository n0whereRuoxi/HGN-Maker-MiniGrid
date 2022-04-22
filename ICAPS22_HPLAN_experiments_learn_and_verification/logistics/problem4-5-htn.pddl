( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-713 - location
    l000-847 - location
    p468 - obj
    p351 - obj
    p359 - obj
    p338 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-713 c000 )
    ( in-city l000-847 c000 )
    ( obj-at p468 l000-713 )
    ( obj-at p351 l000-847 )
    ( obj-at p359 l000-847 )
    ( obj-at p338 l000-847 )
  )
  ( :tasks
    ( Deliver-4Pkg p468 p351 p359 p338 l000-000 )
  )
)
