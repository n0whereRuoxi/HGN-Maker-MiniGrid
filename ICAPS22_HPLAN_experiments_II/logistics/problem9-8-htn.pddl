( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-878 - location
    l000-93 - location
    l000-311 - location
    l000-328 - location
    l000-691 - location
    l000-129 - location
    l000-548 - location
    l000-685 - location
    l000-233 - location
    l000-696 - location
    l000-898 - location
    p654 - obj
    p729 - obj
    p920 - obj
    p55 - obj
    p172 - obj
    p509 - obj
    p564 - obj
    p459 - obj
    p697 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-878 c000 )
    ( in-city l000-93 c000 )
    ( in-city l000-311 c000 )
    ( in-city l000-328 c000 )
    ( in-city l000-691 c000 )
    ( in-city l000-129 c000 )
    ( in-city l000-548 c000 )
    ( in-city l000-685 c000 )
    ( in-city l000-233 c000 )
    ( in-city l000-696 c000 )
    ( in-city l000-898 c000 )
    ( obj-at p654 l000-898 )
    ( obj-at p729 l000-696 )
    ( obj-at p920 l000-696 )
    ( obj-at p55 l000-691 )
    ( obj-at p172 l000-878 )
    ( obj-at p509 l000-129 )
    ( obj-at p564 l000-311 )
    ( obj-at p459 l000-328 )
    ( obj-at p697 l000-93 )
  )
  ( :tasks
    ( Deliver-9Pkg p654 p729 p920 p55 p172 p509 p564 p459 p697 l000-000 )
  )
)
