( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-780 - location
    l000-599 - location
    l000-263 - location
    l000-388 - location
    l000-484 - location
    l000-96 - location
    l000-473 - location
    p237 - obj
    p71 - obj
    p151 - obj
    p325 - obj
    p858 - obj
    p91 - obj
    p18 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-780 c000 )
    ( in-city l000-599 c000 )
    ( in-city l000-263 c000 )
    ( in-city l000-388 c000 )
    ( in-city l000-484 c000 )
    ( in-city l000-96 c000 )
    ( in-city l000-473 c000 )
    ( obj-at p237 l000-599 )
    ( obj-at p71 l000-473 )
    ( obj-at p151 l000-599 )
    ( obj-at p325 l000-484 )
    ( obj-at p858 l000-96 )
    ( obj-at p91 l000-484 )
    ( obj-at p18 l000-599 )
  )
  ( :tasks
    ( Deliver-7Pkg p237 p71 p151 p325 p858 p91 p18 l000-000 )
  )
)
