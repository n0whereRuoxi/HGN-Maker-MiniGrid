( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-450 - location
    l000-28 - location
    p859 - obj
    p551 - obj
    p720 - obj
    p985 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-450 c000 )
    ( in-city l000-28 c000 )
    ( obj-at p859 l000-28 )
    ( obj-at p551 l000-28 )
    ( obj-at p720 l000-28 )
    ( obj-at p985 l000-450 )
  )
  ( :tasks
    ( Deliver-4Pkg p859 p551 p720 p985 l000-000 )
  )
)
