( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-79 - location
    l000-773 - location
    l000-43 - location
    l000-905 - location
    l000-125 - location
    l000-493 - location
    l000-554 - location
    l000-31 - location
    l000-569 - location
    l000-14 - location
    l000-852 - location
    l000-520 - location
    p531 - obj
    p910 - obj
    p803 - obj
    p196 - obj
    p75 - obj
    p499 - obj
    p387 - obj
    p18 - obj
    p667 - obj
    p359 - obj
    p812 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-79 c000 )
    ( in-city l000-773 c000 )
    ( in-city l000-43 c000 )
    ( in-city l000-905 c000 )
    ( in-city l000-125 c000 )
    ( in-city l000-493 c000 )
    ( in-city l000-554 c000 )
    ( in-city l000-31 c000 )
    ( in-city l000-569 c000 )
    ( in-city l000-14 c000 )
    ( in-city l000-852 c000 )
    ( in-city l000-520 c000 )
    ( obj-at p531 l000-43 )
    ( obj-at p910 l000-554 )
    ( obj-at p803 l000-125 )
    ( obj-at p196 l000-43 )
    ( obj-at p75 l000-493 )
    ( obj-at p499 l000-31 )
    ( obj-at p387 l000-43 )
    ( obj-at p18 l000-79 )
    ( obj-at p667 l000-31 )
    ( obj-at p359 l000-852 )
    ( obj-at p812 l000-569 )
  )
  ( :tasks
    ( Deliver-11Pkg p531 p910 p803 p196 p75 p499 p387 p18 p667 p359 p812 l000-000 )
  )
)
