( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-744 - location
    l000-73 - location
    p552 - obj
    p815 - obj
    p10 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-744 c000 )
    ( in-city l000-73 c000 )
    ( obj-at p552 l000-73 )
    ( obj-at p815 l000-744 )
    ( obj-at p10 l000-744 )
  )
  ( :tasks
    ( Deliver-3Pkg p552 p815 p10 l000-000 )
  )
)
