( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-132 - location
    l000-212 - location
    l000-591 - location
    l000-25 - location
    l000-238 - location
    l000-384 - location
    l000-387 - location
    l000-905 - location
    l000-395 - location
    p947 - obj
    p280 - obj
    p165 - obj
    p187 - obj
    p488 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-132 c000 )
    ( in-city l000-212 c000 )
    ( in-city l000-591 c000 )
    ( in-city l000-25 c000 )
    ( in-city l000-238 c000 )
    ( in-city l000-384 c000 )
    ( in-city l000-387 c000 )
    ( in-city l000-905 c000 )
    ( in-city l000-395 c000 )
    ( obj-at p947 l000-25 )
    ( obj-at p280 l000-212 )
    ( obj-at p165 l000-384 )
    ( obj-at p187 l000-905 )
    ( obj-at p488 l000-395 )
  )
  ( :tasks
    ( Deliver-5Pkg p947 p280 p165 p187 p488 l000-000 )
  )
)
