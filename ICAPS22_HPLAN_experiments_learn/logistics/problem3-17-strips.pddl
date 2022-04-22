( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-544 - location
    l000-196 - location
    l000-322 - location
    p793 - obj
    p814 - obj
    p375 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-544 c000 )
    ( in-city l000-196 c000 )
    ( in-city l000-322 c000 )
    ( obj-at p793 l000-544 )
    ( obj-at p814 l000-322 )
    ( obj-at p375 l000-322 )
  )
  ( :goal
    ( and
      ( obj-at p793 l000-000 )
      ( obj-at p814 l000-000 )
      ( obj-at p375 l000-000 )
    )
  )
)
