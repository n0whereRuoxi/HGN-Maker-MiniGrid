( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-597 - location
    l000-956 - location
    l000-489 - location
    l000-379 - location
    l000-255 - location
    l000-221 - location
    l000-566 - location
    p264 - obj
    p811 - obj
    p774 - obj
    p74 - obj
    p898 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-597 c000 )
    ( in-city l000-956 c000 )
    ( in-city l000-489 c000 )
    ( in-city l000-379 c000 )
    ( in-city l000-255 c000 )
    ( in-city l000-221 c000 )
    ( in-city l000-566 c000 )
    ( obj-at p264 l000-255 )
    ( obj-at p811 l000-489 )
    ( obj-at p774 l000-255 )
    ( obj-at p74 l000-489 )
    ( obj-at p898 l000-566 )
  )
  ( :tasks
    ( Deliver-5Pkg p264 p811 p774 p74 p898 l000-000 )
  )
)
