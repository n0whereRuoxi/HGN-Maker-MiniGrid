( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-23 - location
    l000-841 - location
    l000-958 - location
    p839 - obj
    p140 - obj
    p697 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-23 c000 )
    ( in-city l000-841 c000 )
    ( in-city l000-958 c000 )
    ( obj-at p839 l000-958 )
    ( obj-at p140 l000-23 )
    ( obj-at p697 l000-958 )
  )
  ( :tasks
    ( Deliver-3Pkg p839 p140 p697 l000-000 )
  )
)
