( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-426 - location
    l000-477 - location
    l000-683 - location
    p58 - obj
    p68 - obj
    p250 - obj
    p836 - obj
    p679 - obj
    p432 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-426 c000 )
    ( in-city l000-477 c000 )
    ( in-city l000-683 c000 )
    ( obj-at p58 l000-426 )
    ( obj-at p68 l000-683 )
    ( obj-at p250 l000-426 )
    ( obj-at p836 l000-683 )
    ( obj-at p679 l000-426 )
    ( obj-at p432 l000-683 )
  )
  ( :tasks
    ( Deliver-6Pkg p58 p68 p250 p836 p679 p432 l000-000 )
  )
)
