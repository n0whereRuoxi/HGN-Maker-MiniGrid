( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-991 - location
    l000-203 - location
    l000-522 - location
    l000-537 - location
    l000-769 - location
    l000-425 - location
    p522 - obj
    p522 - obj
    p425 - obj
    p522 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-991 c000 )
    ( in-city l000-203 c000 )
    ( in-city l000-522 c000 )
    ( in-city l000-537 c000 )
    ( in-city l000-769 c000 )
    ( in-city l000-425 c000 )
    ( obj-at p522 l000-522 )
    ( obj-at p522 l000-522 )
    ( obj-at p425 l000-425 )
    ( obj-at p522 l000-522 )
  )
  ( :goal
    ( and
      ( obj-at p522 l000-000 )
      ( obj-at p522 l000-000 )
      ( obj-at p425 l000-000 )
      ( obj-at p522 l000-000 )
    )
  )
)
