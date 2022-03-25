( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-130 - location
    l000-850 - location
    l000-458 - location
    l000-910 - location
    l000-947 - location
    l000-402 - location
    p317 - obj
    p747 - obj
    p185 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-130 c000 )
    ( in-city l000-850 c000 )
    ( in-city l000-458 c000 )
    ( in-city l000-910 c000 )
    ( in-city l000-947 c000 )
    ( in-city l000-402 c000 )
    ( obj-at p317 l000-402 )
    ( obj-at p747 l000-402 )
    ( obj-at p185 l000-947 )
  )
  ( :tasks
    ( Deliver-3Pkg p317 p747 p185 l000-000 )
  )
)
