( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-297 - location
    l000-124 - location
    p942 - obj
    p882 - obj
    p647 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-297 c000 )
    ( in-city l000-124 c000 )
    ( obj-at p942 l000-124 )
    ( obj-at p882 l000-124 )
    ( obj-at p647 l000-297 )
  )
  ( :tasks
    ( Deliver-3Pkg p942 p882 p647 l000-000 )
  )
)
