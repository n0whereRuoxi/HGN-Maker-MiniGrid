( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-905 - location
    l000-725 - location
    p271 - obj
    p440 - obj
    p490 - obj
    p130 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-905 c000 )
    ( in-city l000-725 c000 )
    ( obj-at p271 l000-905 )
    ( obj-at p440 l000-725 )
    ( obj-at p490 l000-725 )
    ( obj-at p130 l000-725 )
  )
  ( :tasks
    ( Deliver-4Pkg p271 p440 p490 p130 l000-000 )
  )
)
