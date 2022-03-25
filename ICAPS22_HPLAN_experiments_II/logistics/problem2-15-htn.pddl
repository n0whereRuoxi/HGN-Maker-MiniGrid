( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-905 - location
    l000-301 - location
    l000-972 - location
    l000-489 - location
    p409 - obj
    p245 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-905 c000 )
    ( in-city l000-301 c000 )
    ( in-city l000-972 c000 )
    ( in-city l000-489 c000 )
    ( obj-at p409 l000-905 )
    ( obj-at p245 l000-972 )
  )
  ( :tasks
    ( Deliver-2Pkg p409 p245 l000-000 )
  )
)
