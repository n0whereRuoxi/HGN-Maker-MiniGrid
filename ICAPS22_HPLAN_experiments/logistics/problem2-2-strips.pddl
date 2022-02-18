( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-175 - location
    l000-885 - location
    p33 - obj
    p291 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-175 c000 )
    ( in-city l000-885 c000 )
    ( obj-at p33 l000-885 )
    ( obj-at p291 l000-175 )
  )
  ( :goal
    ( and
      ( obj-at p33 l000-000 )
      ( obj-at p291 l000-000 )
    )
  )
)
