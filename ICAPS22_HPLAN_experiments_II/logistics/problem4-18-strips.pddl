( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-336 - location
    l000-303 - location
    l000-870 - location
    l000-927 - location
    p74 - obj
    p241 - obj
    p454 - obj
    p892 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-336 c000 )
    ( in-city l000-303 c000 )
    ( in-city l000-870 c000 )
    ( in-city l000-927 c000 )
    ( obj-at p74 l000-870 )
    ( obj-at p241 l000-336 )
    ( obj-at p454 l000-927 )
    ( obj-at p892 l000-927 )
  )
  ( :goal
    ( and
      ( obj-at p74 l000-000 )
      ( obj-at p241 l000-000 )
      ( obj-at p454 l000-000 )
      ( obj-at p892 l000-000 )
    )
  )
)
