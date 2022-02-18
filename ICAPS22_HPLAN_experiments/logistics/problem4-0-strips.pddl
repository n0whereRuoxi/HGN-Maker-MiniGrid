( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-390 - location
    l000-715 - location
    l000-710 - location
    l000-999 - location
    l000-773 - location
    l000-533 - location
    l000-512 - location
    p45 - obj
    p46 - obj
    p350 - obj
    p330 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-390 c000 )
    ( in-city l000-715 c000 )
    ( in-city l000-710 c000 )
    ( in-city l000-999 c000 )
    ( in-city l000-773 c000 )
    ( in-city l000-533 c000 )
    ( in-city l000-512 c000 )
    ( obj-at p45 l000-773 )
    ( obj-at p46 l000-710 )
    ( obj-at p350 l000-999 )
    ( obj-at p330 l000-773 )
  )
  ( :goal
    ( and
      ( obj-at p45 l000-000 )
      ( obj-at p46 l000-000 )
      ( obj-at p350 l000-000 )
      ( obj-at p330 l000-000 )
    )
  )
)
