( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-875 - location
    l000-93 - location
    l000-701 - location
    p256 - obj
    p518 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-875 c000 )
    ( in-city l000-93 c000 )
    ( in-city l000-701 c000 )
    ( obj-at p256 l000-701 )
    ( obj-at p518 l000-875 )
  )
  ( :tasks
    ( Deliver-2Pkg p256 p518 l000-000 )
  )
)
