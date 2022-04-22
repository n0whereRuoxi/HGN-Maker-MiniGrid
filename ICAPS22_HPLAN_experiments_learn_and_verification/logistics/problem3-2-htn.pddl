( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-5 - location
    l000-184 - location
    l000-536 - location
    l000-229 - location
    p594 - obj
    p560 - obj
    p623 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-5 c000 )
    ( in-city l000-184 c000 )
    ( in-city l000-536 c000 )
    ( in-city l000-229 c000 )
    ( obj-at p594 l000-536 )
    ( obj-at p560 l000-229 )
    ( obj-at p623 l000-5 )
  )
  ( :tasks
    ( Deliver-3Pkg p594 p560 p623 l000-000 )
  )
)
