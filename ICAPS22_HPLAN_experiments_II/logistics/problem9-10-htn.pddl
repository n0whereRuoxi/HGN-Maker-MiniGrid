( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-847 - location
    l000-679 - location
    l000-26 - location
    l000-84 - location
    l000-537 - location
    l000-380 - location
    p856 - obj
    p391 - obj
    p421 - obj
    p73 - obj
    p343 - obj
    p975 - obj
    p157 - obj
    p526 - obj
    p21 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-847 c000 )
    ( in-city l000-679 c000 )
    ( in-city l000-26 c000 )
    ( in-city l000-84 c000 )
    ( in-city l000-537 c000 )
    ( in-city l000-380 c000 )
    ( obj-at p856 l000-537 )
    ( obj-at p391 l000-84 )
    ( obj-at p421 l000-84 )
    ( obj-at p73 l000-380 )
    ( obj-at p343 l000-84 )
    ( obj-at p975 l000-679 )
    ( obj-at p157 l000-679 )
    ( obj-at p526 l000-537 )
    ( obj-at p21 l000-84 )
  )
  ( :tasks
    ( Deliver-9Pkg p856 p391 p421 p73 p343 p975 p157 p526 p21 l000-000 )
  )
)
