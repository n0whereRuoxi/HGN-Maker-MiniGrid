( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-365 - location
    l000-281 - location
    l000-472 - location
    l000-485 - location
    p519 - obj
    p350 - obj
    p749 - obj
    p127 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-365 c000 )
    ( in-city l000-281 c000 )
    ( in-city l000-472 c000 )
    ( in-city l000-485 c000 )
    ( obj-at p519 l000-281 )
    ( obj-at p350 l000-365 )
    ( obj-at p749 l000-472 )
    ( obj-at p127 l000-365 )
  )
  ( :tasks
    ( Deliver-4Pkg p519 p350 p749 p127 l000-000 )
  )
)
