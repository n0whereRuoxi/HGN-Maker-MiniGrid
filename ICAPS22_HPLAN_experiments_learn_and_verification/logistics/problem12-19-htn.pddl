( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-792 - location
    l000-45 - location
    l000-88 - location
    l000-785 - location
    l000-213 - location
    l000-441 - location
    l000-376 - location
    l000-970 - location
    l000-270 - location
    l000-879 - location
    l000-842 - location
    l000-470 - location
    l000-632 - location
    l000-105 - location
    l000-398 - location
    l000-835 - location
    l000-661 - location
    l000-153 - location
    l000-292 - location
    l000-751 - location
    l000-976 - location
    l000-315 - location
    l000-295 - location
    l000-46 - location
    p228 - obj
    p348 - obj
    p90 - obj
    p556 - obj
    p107 - obj
    p407 - obj
    p540 - obj
    p105 - obj
    p704 - obj
    p291 - obj
    p36 - obj
    p171 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-792 c000 )
    ( in-city l000-45 c000 )
    ( in-city l000-88 c000 )
    ( in-city l000-785 c000 )
    ( in-city l000-213 c000 )
    ( in-city l000-441 c000 )
    ( in-city l000-376 c000 )
    ( in-city l000-970 c000 )
    ( in-city l000-270 c000 )
    ( in-city l000-879 c000 )
    ( in-city l000-842 c000 )
    ( in-city l000-470 c000 )
    ( in-city l000-632 c000 )
    ( in-city l000-105 c000 )
    ( in-city l000-398 c000 )
    ( in-city l000-835 c000 )
    ( in-city l000-661 c000 )
    ( in-city l000-153 c000 )
    ( in-city l000-292 c000 )
    ( in-city l000-751 c000 )
    ( in-city l000-976 c000 )
    ( in-city l000-315 c000 )
    ( in-city l000-295 c000 )
    ( in-city l000-46 c000 )
    ( obj-at p228 l000-441 )
    ( obj-at p348 l000-792 )
    ( obj-at p90 l000-976 )
    ( obj-at p556 l000-842 )
    ( obj-at p107 l000-315 )
    ( obj-at p407 l000-842 )
    ( obj-at p540 l000-785 )
    ( obj-at p105 l000-842 )
    ( obj-at p704 l000-632 )
    ( obj-at p291 l000-45 )
    ( obj-at p36 l000-315 )
    ( obj-at p171 l000-842 )
  )
  ( :tasks
    ( Deliver-12Pkg p228 p348 p90 p556 p107 p407 p540 p105 p704 p291 p36 p171 l000-000 )
  )
)
