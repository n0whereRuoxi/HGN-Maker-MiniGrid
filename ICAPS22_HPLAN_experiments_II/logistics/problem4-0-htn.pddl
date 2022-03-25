( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-802 - location
    l000-414 - location
    l000-380 - location
    l000-360 - location
    p810 - obj
    p985 - obj
    p662 - obj
    p149 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-802 c000 )
    ( in-city l000-414 c000 )
    ( in-city l000-380 c000 )
    ( in-city l000-360 c000 )
    ( obj-at p810 l000-414 )
    ( obj-at p985 l000-802 )
    ( obj-at p662 l000-414 )
    ( obj-at p149 l000-414 )
  )
  ( :tasks
    ( Deliver-4Pkg p810 p985 p662 p149 l000-000 )
  )
)
