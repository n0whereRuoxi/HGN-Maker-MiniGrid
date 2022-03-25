( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-689 - location
    l000-628 - location
    l000-701 - location
    l000-954 - location
    l000-831 - location
    p462 - obj
    p45 - obj
    p910 - obj
    p555 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-689 c000 )
    ( in-city l000-628 c000 )
    ( in-city l000-701 c000 )
    ( in-city l000-954 c000 )
    ( in-city l000-831 c000 )
    ( obj-at p462 l000-628 )
    ( obj-at p45 l000-689 )
    ( obj-at p910 l000-689 )
    ( obj-at p555 l000-628 )
  )
  ( :tasks
    ( Deliver-4Pkg p462 p45 p910 p555 l000-000 )
  )
)
