( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-575 - location
    l000-514 - location
    l000-588 - location
    l000-655 - location
    l000-721 - location
    p909 - obj
    p211 - obj
    p680 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-575 c000 )
    ( in-city l000-514 c000 )
    ( in-city l000-588 c000 )
    ( in-city l000-655 c000 )
    ( in-city l000-721 c000 )
    ( obj-at p909 l000-588 )
    ( obj-at p211 l000-575 )
    ( obj-at p680 l000-588 )
  )
  ( :tasks
    ( Deliver-3Pkg p909 p211 p680 l000-000 )
  )
)
