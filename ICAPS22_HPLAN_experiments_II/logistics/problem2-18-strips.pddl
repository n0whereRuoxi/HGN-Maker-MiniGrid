( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-747 - location
    p362 - obj
    p166 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-747 c000 )
    ( obj-at p362 l000-747 )
    ( obj-at p166 l000-747 )
  )
  ( :goal
    ( and
      ( obj-at p362 l000-000 )
      ( obj-at p166 l000-000 )
    )
  )
)
