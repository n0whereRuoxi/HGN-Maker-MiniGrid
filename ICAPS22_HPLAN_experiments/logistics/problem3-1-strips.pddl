( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-111 - location
    l000-670 - location
    l000-923 - location
    l000-518 - location
    l000-134 - location
    l000-184 - location
    p670 - obj
    p111 - obj
    p184 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-111 c000 )
    ( in-city l000-670 c000 )
    ( in-city l000-923 c000 )
    ( in-city l000-518 c000 )
    ( in-city l000-134 c000 )
    ( in-city l000-184 c000 )
    ( obj-at p670 l000-670 )
    ( obj-at p111 l000-111 )
    ( obj-at p184 l000-184 )
  )
  ( :goal
    ( and
      ( obj-at p670 l000-000 )
      ( obj-at p111 l000-000 )
      ( obj-at p184 l000-000 )
    )
  )
)
