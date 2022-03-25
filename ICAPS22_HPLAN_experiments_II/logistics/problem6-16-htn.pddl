( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-179 - location
    l000-389 - location
    l000-823 - location
    p852 - obj
    p333 - obj
    p956 - obj
    p893 - obj
    p927 - obj
    p52 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-179 c000 )
    ( in-city l000-389 c000 )
    ( in-city l000-823 c000 )
    ( obj-at p852 l000-389 )
    ( obj-at p333 l000-389 )
    ( obj-at p956 l000-179 )
    ( obj-at p893 l000-389 )
    ( obj-at p927 l000-823 )
    ( obj-at p52 l000-179 )
  )
  ( :tasks
    ( Deliver-6Pkg p852 p333 p956 p893 p927 p52 l000-000 )
  )
)
