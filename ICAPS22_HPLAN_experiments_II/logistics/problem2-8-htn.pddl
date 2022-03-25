( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-343 - location
    l000-563 - location
    l000-78 - location
    p964 - obj
    p519 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-343 c000 )
    ( in-city l000-563 c000 )
    ( in-city l000-78 c000 )
    ( obj-at p964 l000-563 )
    ( obj-at p519 l000-343 )
  )
  ( :tasks
    ( Deliver-2Pkg p964 p519 l000-000 )
  )
)
