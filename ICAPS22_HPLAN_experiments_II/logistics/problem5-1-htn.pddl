( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-870 - location
    l000-782 - location
    l000-442 - location
    l000-68 - location
    l000-449 - location
    l000-642 - location
    l000-118 - location
    p488 - obj
    p387 - obj
    p524 - obj
    p235 - obj
    p737 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-870 c000 )
    ( in-city l000-782 c000 )
    ( in-city l000-442 c000 )
    ( in-city l000-68 c000 )
    ( in-city l000-449 c000 )
    ( in-city l000-642 c000 )
    ( in-city l000-118 c000 )
    ( obj-at p488 l000-118 )
    ( obj-at p387 l000-642 )
    ( obj-at p524 l000-442 )
    ( obj-at p235 l000-870 )
    ( obj-at p737 l000-68 )
  )
  ( :tasks
    ( Deliver-5Pkg p488 p387 p524 p235 p737 l000-000 )
  )
)
