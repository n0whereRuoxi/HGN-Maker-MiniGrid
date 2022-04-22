( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-140 - location
    l000-223 - location
    l000-115 - location
    l000-126 - location
    l000-446 - location
    l000-530 - location
    l000-719 - location
    l000-941 - location
    l000-374 - location
    l000-488 - location
    l000-453 - location
    l000-921 - location
    l000-76 - location
    l000-876 - location
    p319 - obj
    p867 - obj
    p507 - obj
    p244 - obj
    p810 - obj
    p100 - obj
    p43 - obj
    p434 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-140 c000 )
    ( in-city l000-223 c000 )
    ( in-city l000-115 c000 )
    ( in-city l000-126 c000 )
    ( in-city l000-446 c000 )
    ( in-city l000-530 c000 )
    ( in-city l000-719 c000 )
    ( in-city l000-941 c000 )
    ( in-city l000-374 c000 )
    ( in-city l000-488 c000 )
    ( in-city l000-453 c000 )
    ( in-city l000-921 c000 )
    ( in-city l000-76 c000 )
    ( in-city l000-876 c000 )
    ( obj-at p319 l000-941 )
    ( obj-at p867 l000-719 )
    ( obj-at p507 l000-876 )
    ( obj-at p244 l000-115 )
    ( obj-at p810 l000-453 )
    ( obj-at p100 l000-223 )
    ( obj-at p43 l000-374 )
    ( obj-at p434 l000-530 )
  )
  ( :tasks
    ( Deliver-8Pkg p319 p867 p507 p244 p810 p100 p43 p434 l000-000 )
  )
)
