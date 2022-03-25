( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-276 - location
    l000-460 - location
    p6 - obj
    p524 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-276 c000 )
    ( in-city l000-460 c000 )
    ( obj-at p6 l000-460 )
    ( obj-at p524 l000-276 )
  )
  ( :tasks
    ( Deliver-2Pkg p6 p524 l000-000 )
  )
)
