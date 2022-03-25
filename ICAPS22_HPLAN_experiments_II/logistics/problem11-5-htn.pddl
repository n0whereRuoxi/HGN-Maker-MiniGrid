( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-395 - location
    l000-776 - location
    l000-547 - location
    l000-896 - location
    l000-642 - location
    l000-550 - location
    l000-183 - location
    l000-548 - location
    l000-816 - location
    l000-526 - location
    l000-294 - location
    l000-132 - location
    l000-940 - location
    l000-360 - location
    l000-302 - location
    l000-345 - location
    l000-340 - location
    p83 - obj
    p175 - obj
    p920 - obj
    p32 - obj
    p618 - obj
    p665 - obj
    p128 - obj
    p34 - obj
    p995 - obj
    p975 - obj
    p601 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-395 c000 )
    ( in-city l000-776 c000 )
    ( in-city l000-547 c000 )
    ( in-city l000-896 c000 )
    ( in-city l000-642 c000 )
    ( in-city l000-550 c000 )
    ( in-city l000-183 c000 )
    ( in-city l000-548 c000 )
    ( in-city l000-816 c000 )
    ( in-city l000-526 c000 )
    ( in-city l000-294 c000 )
    ( in-city l000-132 c000 )
    ( in-city l000-940 c000 )
    ( in-city l000-360 c000 )
    ( in-city l000-302 c000 )
    ( in-city l000-345 c000 )
    ( in-city l000-340 c000 )
    ( obj-at p83 l000-896 )
    ( obj-at p175 l000-360 )
    ( obj-at p920 l000-302 )
    ( obj-at p32 l000-776 )
    ( obj-at p618 l000-816 )
    ( obj-at p665 l000-526 )
    ( obj-at p128 l000-526 )
    ( obj-at p34 l000-340 )
    ( obj-at p995 l000-302 )
    ( obj-at p975 l000-395 )
    ( obj-at p601 l000-294 )
  )
  ( :tasks
    ( Deliver-11Pkg p83 p175 p920 p32 p618 p665 p128 p34 p995 p975 p601 l000-000 )
  )
)
