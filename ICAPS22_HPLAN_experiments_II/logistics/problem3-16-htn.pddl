( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-66 - location
    l000-838 - location
    p743 - obj
    p209 - obj
    p391 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-66 c000 )
    ( in-city l000-838 c000 )
    ( obj-at p743 l000-838 )
    ( obj-at p209 l000-66 )
    ( obj-at p391 l000-838 )
  )
  ( :tasks
    ( Deliver-3Pkg p743 p209 p391 l000-000 )
  )
)
