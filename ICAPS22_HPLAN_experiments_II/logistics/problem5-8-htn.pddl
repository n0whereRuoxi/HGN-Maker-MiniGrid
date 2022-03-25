( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-641 - location
    l000-201 - location
    l000-927 - location
    l000-700 - location
    l000-51 - location
    l000-45 - location
    p932 - obj
    p942 - obj
    p784 - obj
    p308 - obj
    p138 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-641 c000 )
    ( in-city l000-201 c000 )
    ( in-city l000-927 c000 )
    ( in-city l000-700 c000 )
    ( in-city l000-51 c000 )
    ( in-city l000-45 c000 )
    ( obj-at p932 l000-700 )
    ( obj-at p942 l000-201 )
    ( obj-at p784 l000-51 )
    ( obj-at p308 l000-700 )
    ( obj-at p138 l000-927 )
  )
  ( :tasks
    ( Deliver-5Pkg p932 p942 p784 p308 p138 l000-000 )
  )
)
