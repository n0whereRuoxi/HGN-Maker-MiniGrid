( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-640 - location
    l000-744 - location
    l000-172 - location
    l000-69 - location
    l000-303 - location
    p938 - obj
    p218 - obj
    p720 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-640 c000 )
    ( in-city l000-744 c000 )
    ( in-city l000-172 c000 )
    ( in-city l000-69 c000 )
    ( in-city l000-303 c000 )
    ( obj-at p938 l000-640 )
    ( obj-at p218 l000-640 )
    ( obj-at p720 l000-744 )
  )
  ( :tasks
    ( Deliver-3Pkg p938 p218 p720 l000-000 )
  )
)
