( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-324 - location
    l000-751 - location
    l000-983 - location
    p610 - obj
    p789 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-324 c000 )
    ( in-city l000-751 c000 )
    ( in-city l000-983 c000 )
    ( obj-at p610 l000-324 )
    ( obj-at p789 l000-751 )
  )
  ( :goal
    ( and
      ( obj-at p610 l000-000 )
      ( obj-at p789 l000-000 )
    )
  )
)
