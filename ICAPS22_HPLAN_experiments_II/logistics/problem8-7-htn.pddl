( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-70 - location
    l000-101 - location
    l000-578 - location
    l000-493 - location
    l000-878 - location
    l000-296 - location
    l000-475 - location
    l000-155 - location
    l000-563 - location
    l000-476 - location
    l000-338 - location
    l000-488 - location
    p173 - obj
    p919 - obj
    p61 - obj
    p15 - obj
    p342 - obj
    p662 - obj
    p530 - obj
    p912 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-70 c000 )
    ( in-city l000-101 c000 )
    ( in-city l000-578 c000 )
    ( in-city l000-493 c000 )
    ( in-city l000-878 c000 )
    ( in-city l000-296 c000 )
    ( in-city l000-475 c000 )
    ( in-city l000-155 c000 )
    ( in-city l000-563 c000 )
    ( in-city l000-476 c000 )
    ( in-city l000-338 c000 )
    ( in-city l000-488 c000 )
    ( obj-at p173 l000-70 )
    ( obj-at p919 l000-493 )
    ( obj-at p61 l000-488 )
    ( obj-at p15 l000-878 )
    ( obj-at p342 l000-70 )
    ( obj-at p662 l000-493 )
    ( obj-at p530 l000-296 )
    ( obj-at p912 l000-578 )
  )
  ( :tasks
    ( Deliver-8Pkg p173 p919 p61 p15 p342 p662 p530 p912 l000-000 )
  )
)
