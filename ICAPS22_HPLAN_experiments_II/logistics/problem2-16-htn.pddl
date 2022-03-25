( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-410 - location
    l000-304 - location
    p719 - obj
    p675 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-410 c000 )
    ( in-city l000-304 c000 )
    ( obj-at p719 l000-304 )
    ( obj-at p675 l000-410 )
  )
  ( :tasks
    ( Deliver-2Pkg p719 p675 l000-000 )
  )
)
