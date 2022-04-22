( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-642 - location
    l000-986 - location
    l000-847 - location
    l000-720 - location
    l000-628 - location
    l000-201 - location
    l000-386 - location
    l000-339 - location
    l000-40 - location
    p245 - obj
    p765 - obj
    p404 - obj
    p134 - obj
    p636 - obj
    p243 - obj
    p634 - obj
    p975 - obj
    p662 - obj
    p664 - obj
    p939 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-642 c000 )
    ( in-city l000-986 c000 )
    ( in-city l000-847 c000 )
    ( in-city l000-720 c000 )
    ( in-city l000-628 c000 )
    ( in-city l000-201 c000 )
    ( in-city l000-386 c000 )
    ( in-city l000-339 c000 )
    ( in-city l000-40 c000 )
    ( obj-at p245 l000-628 )
    ( obj-at p765 l000-986 )
    ( obj-at p404 l000-386 )
    ( obj-at p134 l000-339 )
    ( obj-at p636 l000-40 )
    ( obj-at p243 l000-986 )
    ( obj-at p634 l000-386 )
    ( obj-at p975 l000-339 )
    ( obj-at p662 l000-847 )
    ( obj-at p664 l000-201 )
    ( obj-at p939 l000-386 )
  )
  ( :tasks
    ( Deliver-11Pkg p245 p765 p404 p134 p636 p243 p634 p975 p662 p664 p939 l000-000 )
  )
)
