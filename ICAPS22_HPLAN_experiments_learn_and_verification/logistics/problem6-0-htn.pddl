( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-658 - location
    l000-730 - location
    l000-245 - location
    l000-496 - location
    l000-363 - location
    p50 - obj
    p245 - obj
    p313 - obj
    p459 - obj
    p650 - obj
    p511 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-658 c000 )
    ( in-city l000-730 c000 )
    ( in-city l000-245 c000 )
    ( in-city l000-496 c000 )
    ( in-city l000-363 c000 )
    ( obj-at p50 l000-245 )
    ( obj-at p245 l000-658 )
    ( obj-at p313 l000-245 )
    ( obj-at p459 l000-245 )
    ( obj-at p650 l000-496 )
    ( obj-at p511 l000-363 )
  )
  ( :tasks
    ( Deliver-6Pkg p50 p245 p313 p459 p650 p511 l000-000 )
  )
)
