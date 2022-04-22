( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-554 - location
    l000-553 - location
    l000-221 - location
    l000-838 - location
    p790 - obj
    p264 - obj
    p238 - obj
    p911 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-554 c000 )
    ( in-city l000-553 c000 )
    ( in-city l000-221 c000 )
    ( in-city l000-838 c000 )
    ( obj-at p790 l000-221 )
    ( obj-at p264 l000-221 )
    ( obj-at p238 l000-221 )
    ( obj-at p911 l000-553 )
  )
  ( :goal
    ( and
      ( obj-at p790 l000-000 )
      ( obj-at p264 l000-000 )
      ( obj-at p238 l000-000 )
      ( obj-at p911 l000-000 )
    )
  )
)
