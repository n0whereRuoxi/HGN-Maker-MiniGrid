( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-712 - location
    l000-951 - location
    l000-567 - location
    l000-358 - location
    l000-772 - location
    l000-139 - location
    p430 - obj
    p151 - obj
    p210 - obj
    p500 - obj
    p394 - obj
    p178 - obj
    p645 - obj
    p347 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-712 c000 )
    ( in-city l000-951 c000 )
    ( in-city l000-567 c000 )
    ( in-city l000-358 c000 )
    ( in-city l000-772 c000 )
    ( in-city l000-139 c000 )
    ( obj-at p430 l000-358 )
    ( obj-at p151 l000-139 )
    ( obj-at p210 l000-951 )
    ( obj-at p500 l000-772 )
    ( obj-at p394 l000-772 )
    ( obj-at p178 l000-139 )
    ( obj-at p645 l000-567 )
    ( obj-at p347 l000-567 )
  )
  ( :tasks
    ( Deliver-8Pkg p430 p151 p210 p500 p394 p178 p645 p347 l000-000 )
  )
)
