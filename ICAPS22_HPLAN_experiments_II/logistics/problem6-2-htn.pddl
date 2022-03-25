( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-379 - location
    l000-817 - location
    l000-863 - location
    l000-585 - location
    l000-122 - location
    l000-506 - location
    p570 - obj
    p649 - obj
    p351 - obj
    p483 - obj
    p519 - obj
    p826 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-379 c000 )
    ( in-city l000-817 c000 )
    ( in-city l000-863 c000 )
    ( in-city l000-585 c000 )
    ( in-city l000-122 c000 )
    ( in-city l000-506 c000 )
    ( obj-at p570 l000-122 )
    ( obj-at p649 l000-506 )
    ( obj-at p351 l000-585 )
    ( obj-at p483 l000-379 )
    ( obj-at p519 l000-379 )
    ( obj-at p826 l000-122 )
  )
  ( :tasks
    ( Deliver-6Pkg p570 p649 p351 p483 p519 p826 l000-000 )
  )
)
