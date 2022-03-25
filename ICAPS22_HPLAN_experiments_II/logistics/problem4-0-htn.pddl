( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-517 - location
    l000-236 - location
    l000-202 - location
    l000-101 - location
    l000-129 - location
    l000-541 - location
    p111 - obj
    p783 - obj
    p781 - obj
    p312 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-517 c000 )
    ( in-city l000-236 c000 )
    ( in-city l000-202 c000 )
    ( in-city l000-101 c000 )
    ( in-city l000-129 c000 )
    ( in-city l000-541 c000 )
    ( obj-at p111 l000-236 )
    ( obj-at p783 l000-202 )
    ( obj-at p781 l000-101 )
    ( obj-at p312 l000-101 )
  )
  ( :tasks
    ( Deliver-4Pkg p111 p783 p781 p312 l000-000 )
  )
)
