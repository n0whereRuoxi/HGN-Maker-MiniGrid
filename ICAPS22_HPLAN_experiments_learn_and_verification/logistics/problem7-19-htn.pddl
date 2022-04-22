( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-575 - location
    l000-311 - location
    l000-984 - location
    l000-410 - location
    l000-138 - location
    l000-192 - location
    l000-734 - location
    l000-38 - location
    l000-316 - location
    l000-741 - location
    l000-806 - location
    p27 - obj
    p442 - obj
    p474 - obj
    p409 - obj
    p100 - obj
    p661 - obj
    p989 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-575 c000 )
    ( in-city l000-311 c000 )
    ( in-city l000-984 c000 )
    ( in-city l000-410 c000 )
    ( in-city l000-138 c000 )
    ( in-city l000-192 c000 )
    ( in-city l000-734 c000 )
    ( in-city l000-38 c000 )
    ( in-city l000-316 c000 )
    ( in-city l000-741 c000 )
    ( in-city l000-806 c000 )
    ( obj-at p27 l000-741 )
    ( obj-at p442 l000-316 )
    ( obj-at p474 l000-806 )
    ( obj-at p409 l000-38 )
    ( obj-at p100 l000-575 )
    ( obj-at p661 l000-311 )
    ( obj-at p989 l000-984 )
  )
  ( :tasks
    ( Deliver-7Pkg p27 p442 p474 p409 p100 p661 p989 l000-000 )
  )
)
