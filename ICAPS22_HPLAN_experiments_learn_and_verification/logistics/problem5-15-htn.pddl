( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-651 - location
    l000-461 - location
    l000-741 - location
    l000-122 - location
    l000-139 - location
    l000-385 - location
    l000-4 - location
    l000-691 - location
    l000-79 - location
    l000-450 - location
    p353 - obj
    p418 - obj
    p379 - obj
    p792 - obj
    p368 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-651 c000 )
    ( in-city l000-461 c000 )
    ( in-city l000-741 c000 )
    ( in-city l000-122 c000 )
    ( in-city l000-139 c000 )
    ( in-city l000-385 c000 )
    ( in-city l000-4 c000 )
    ( in-city l000-691 c000 )
    ( in-city l000-79 c000 )
    ( in-city l000-450 c000 )
    ( obj-at p353 l000-122 )
    ( obj-at p418 l000-385 )
    ( obj-at p379 l000-651 )
    ( obj-at p792 l000-139 )
    ( obj-at p368 l000-79 )
  )
  ( :tasks
    ( Deliver-5Pkg p353 p418 p379 p792 p368 l000-000 )
  )
)
