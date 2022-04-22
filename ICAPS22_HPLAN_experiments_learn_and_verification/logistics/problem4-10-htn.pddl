( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-251 - location
    l000-133 - location
    l000-493 - location
    l000-894 - location
    l000-933 - location
    p297 - obj
    p421 - obj
    p952 - obj
    p964 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-251 c000 )
    ( in-city l000-133 c000 )
    ( in-city l000-493 c000 )
    ( in-city l000-894 c000 )
    ( in-city l000-933 c000 )
    ( obj-at p297 l000-493 )
    ( obj-at p421 l000-493 )
    ( obj-at p952 l000-933 )
    ( obj-at p964 l000-493 )
  )
  ( :tasks
    ( Deliver-4Pkg p297 p421 p952 p964 l000-000 )
  )
)
