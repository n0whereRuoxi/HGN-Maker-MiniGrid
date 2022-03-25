( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-155 - location
    l000-706 - location
    l000-352 - location
    p431 - obj
    p409 - obj
    p724 - obj
    p797 - obj
    p982 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-155 c000 )
    ( in-city l000-706 c000 )
    ( in-city l000-352 c000 )
    ( obj-at p431 l000-706 )
    ( obj-at p409 l000-155 )
    ( obj-at p724 l000-352 )
    ( obj-at p797 l000-155 )
    ( obj-at p982 l000-706 )
  )
  ( :tasks
    ( Deliver-5Pkg p431 p409 p724 p797 p982 l000-000 )
  )
)
