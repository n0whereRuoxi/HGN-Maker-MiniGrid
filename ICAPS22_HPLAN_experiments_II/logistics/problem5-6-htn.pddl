( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-374 - location
    l000-79 - location
    l000-587 - location
    l000-43 - location
    p769 - obj
    p975 - obj
    p886 - obj
    p529 - obj
    p989 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-374 c000 )
    ( in-city l000-79 c000 )
    ( in-city l000-587 c000 )
    ( in-city l000-43 c000 )
    ( obj-at p769 l000-374 )
    ( obj-at p975 l000-587 )
    ( obj-at p886 l000-587 )
    ( obj-at p529 l000-79 )
    ( obj-at p989 l000-79 )
  )
  ( :tasks
    ( Deliver-5Pkg p769 p975 p886 p529 p989 l000-000 )
  )
)
