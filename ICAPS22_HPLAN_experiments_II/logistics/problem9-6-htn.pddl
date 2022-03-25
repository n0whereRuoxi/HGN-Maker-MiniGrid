( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-780 - location
    l000-187 - location
    l000-614 - location
    l000-198 - location
    l000-763 - location
    l000-415 - location
    l000-720 - location
    l000-275 - location
    l000-70 - location
    p996 - obj
    p149 - obj
    p632 - obj
    p159 - obj
    p401 - obj
    p241 - obj
    p809 - obj
    p800 - obj
    p350 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-780 c000 )
    ( in-city l000-187 c000 )
    ( in-city l000-614 c000 )
    ( in-city l000-198 c000 )
    ( in-city l000-763 c000 )
    ( in-city l000-415 c000 )
    ( in-city l000-720 c000 )
    ( in-city l000-275 c000 )
    ( in-city l000-70 c000 )
    ( obj-at p996 l000-780 )
    ( obj-at p149 l000-415 )
    ( obj-at p632 l000-763 )
    ( obj-at p159 l000-614 )
    ( obj-at p401 l000-198 )
    ( obj-at p241 l000-415 )
    ( obj-at p809 l000-415 )
    ( obj-at p800 l000-780 )
    ( obj-at p350 l000-780 )
  )
  ( :tasks
    ( Deliver-9Pkg p996 p149 p632 p159 p401 p241 p809 p800 p350 l000-000 )
  )
)
