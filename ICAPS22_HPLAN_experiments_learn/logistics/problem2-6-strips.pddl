( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-730 - location
    l000-100 - location
    l000-262 - location
    l000-776 - location
    p789 - obj
    p175 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-730 c000 )
    ( in-city l000-100 c000 )
    ( in-city l000-262 c000 )
    ( in-city l000-776 c000 )
    ( obj-at p789 l000-262 )
    ( obj-at p175 l000-776 )
  )
  ( :goal
    ( and
      ( obj-at p789 l000-000 )
      ( obj-at p175 l000-000 )
    )
  )
)
