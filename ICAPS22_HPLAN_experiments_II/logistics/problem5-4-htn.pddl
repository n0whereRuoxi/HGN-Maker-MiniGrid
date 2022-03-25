( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-103 - location
    l000-982 - location
    l000-725 - location
    l000-174 - location
    l000-379 - location
    l000-294 - location
    p8 - obj
    p455 - obj
    p175 - obj
    p1 - obj
    p689 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-103 c000 )
    ( in-city l000-982 c000 )
    ( in-city l000-725 c000 )
    ( in-city l000-174 c000 )
    ( in-city l000-379 c000 )
    ( in-city l000-294 c000 )
    ( obj-at p8 l000-725 )
    ( obj-at p455 l000-379 )
    ( obj-at p175 l000-103 )
    ( obj-at p1 l000-982 )
    ( obj-at p689 l000-294 )
  )
  ( :tasks
    ( Deliver-5Pkg p8 p455 p175 p1 p689 l000-000 )
  )
)
