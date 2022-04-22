( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-482 - location
    l000-332 - location
    l000-418 - location
    l000-285 - location
    l000-10 - location
    l000-407 - location
    l000-867 - location
    l000-639 - location
    l000-721 - location
    l000-78 - location
    p343 - obj
    p270 - obj
    p135 - obj
    p808 - obj
    p756 - obj
    p879 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-482 c000 )
    ( in-city l000-332 c000 )
    ( in-city l000-418 c000 )
    ( in-city l000-285 c000 )
    ( in-city l000-10 c000 )
    ( in-city l000-407 c000 )
    ( in-city l000-867 c000 )
    ( in-city l000-639 c000 )
    ( in-city l000-721 c000 )
    ( in-city l000-78 c000 )
    ( obj-at p343 l000-867 )
    ( obj-at p270 l000-418 )
    ( obj-at p135 l000-639 )
    ( obj-at p808 l000-639 )
    ( obj-at p756 l000-418 )
    ( obj-at p879 l000-639 )
  )
  ( :tasks
    ( Deliver-6Pkg p343 p270 p135 p808 p756 p879 l000-000 )
  )
)
