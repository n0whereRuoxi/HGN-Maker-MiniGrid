( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-150 - location
    l000-433 - location
    l000-679 - location
    l000-941 - location
    p889 - obj
    p276 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-150 c000 )
    ( in-city l000-433 c000 )
    ( in-city l000-679 c000 )
    ( in-city l000-941 c000 )
    ( obj-at p889 l000-679 )
    ( obj-at p276 l000-941 )
  )
  ( :tasks
    ( Deliver-2Pkg p889 p276 l000-000 )
  )
)
