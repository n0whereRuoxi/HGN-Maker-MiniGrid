( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-267 - location
    l000-785 - location
    l000-782 - location
    l000-757 - location
    l000-963 - location
    p17 - obj
    p341 - obj
    p558 - obj
    p798 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-267 c000 )
    ( in-city l000-785 c000 )
    ( in-city l000-782 c000 )
    ( in-city l000-757 c000 )
    ( in-city l000-963 c000 )
    ( obj-at p17 l000-782 )
    ( obj-at p341 l000-963 )
    ( obj-at p558 l000-785 )
    ( obj-at p798 l000-757 )
  )
  ( :tasks
    ( Deliver-4Pkg p17 p341 p558 p798 l000-000 )
  )
)
