( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-842 - location
    l000-253 - location
    l000-235 - location
    l000-317 - location
    l000-102 - location
    l000-275 - location
    p563 - obj
    p279 - obj
    p324 - obj
    p112 - obj
    p749 - obj
    p18 - obj
    p273 - obj
    p718 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-842 c000 )
    ( in-city l000-253 c000 )
    ( in-city l000-235 c000 )
    ( in-city l000-317 c000 )
    ( in-city l000-102 c000 )
    ( in-city l000-275 c000 )
    ( obj-at p563 l000-317 )
    ( obj-at p279 l000-253 )
    ( obj-at p324 l000-253 )
    ( obj-at p112 l000-842 )
    ( obj-at p749 l000-317 )
    ( obj-at p18 l000-317 )
    ( obj-at p273 l000-253 )
    ( obj-at p718 l000-275 )
  )
  ( :tasks
    ( Deliver-8Pkg p563 p279 p324 p112 p749 p18 p273 p718 l000-000 )
  )
)
