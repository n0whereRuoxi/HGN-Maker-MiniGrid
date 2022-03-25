( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-52 - location
    l000-549 - location
    l000-915 - location
    l000-704 - location
    p15 - obj
    p222 - obj
    p354 - obj
    p181 - obj
    p83 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-52 c000 )
    ( in-city l000-549 c000 )
    ( in-city l000-915 c000 )
    ( in-city l000-704 c000 )
    ( obj-at p15 l000-52 )
    ( obj-at p222 l000-549 )
    ( obj-at p354 l000-549 )
    ( obj-at p181 l000-549 )
    ( obj-at p83 l000-549 )
  )
  ( :tasks
    ( Deliver-5Pkg p15 p222 p354 p181 p83 l000-000 )
  )
)
