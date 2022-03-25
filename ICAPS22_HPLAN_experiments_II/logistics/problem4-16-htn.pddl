( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-949 - location
    l000-204 - location
    l000-746 - location
    p130 - obj
    p369 - obj
    p823 - obj
    p660 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-949 c000 )
    ( in-city l000-204 c000 )
    ( in-city l000-746 c000 )
    ( obj-at p130 l000-949 )
    ( obj-at p369 l000-949 )
    ( obj-at p823 l000-949 )
    ( obj-at p660 l000-746 )
  )
  ( :tasks
    ( Deliver-4Pkg p130 p369 p823 p660 l000-000 )
  )
)
