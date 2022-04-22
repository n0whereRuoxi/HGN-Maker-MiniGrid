( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-802 - location
    l000-16 - location
    l000-774 - location
    l000-8 - location
    l000-590 - location
    l000-106 - location
    l000-230 - location
    l000-766 - location
    p968 - obj
    p793 - obj
    p372 - obj
    p312 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-802 c000 )
    ( in-city l000-16 c000 )
    ( in-city l000-774 c000 )
    ( in-city l000-8 c000 )
    ( in-city l000-590 c000 )
    ( in-city l000-106 c000 )
    ( in-city l000-230 c000 )
    ( in-city l000-766 c000 )
    ( obj-at p968 l000-106 )
    ( obj-at p793 l000-766 )
    ( obj-at p372 l000-766 )
    ( obj-at p312 l000-774 )
  )
  ( :tasks
    ( Deliver-4Pkg p968 p793 p372 p312 l000-000 )
  )
)
