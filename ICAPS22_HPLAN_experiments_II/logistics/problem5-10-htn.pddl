( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-166 - location
    l000-681 - location
    l000-414 - location
    l000-306 - location
    l000-792 - location
    l000-242 - location
    p391 - obj
    p33 - obj
    p292 - obj
    p189 - obj
    p834 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-166 c000 )
    ( in-city l000-681 c000 )
    ( in-city l000-414 c000 )
    ( in-city l000-306 c000 )
    ( in-city l000-792 c000 )
    ( in-city l000-242 c000 )
    ( obj-at p391 l000-242 )
    ( obj-at p33 l000-306 )
    ( obj-at p292 l000-166 )
    ( obj-at p189 l000-242 )
    ( obj-at p834 l000-306 )
  )
  ( :tasks
    ( Deliver-5Pkg p391 p33 p292 p189 p834 l000-000 )
  )
)
