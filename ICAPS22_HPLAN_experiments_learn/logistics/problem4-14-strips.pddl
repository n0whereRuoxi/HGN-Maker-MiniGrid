( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-781 - location
    l000-203 - location
    l000-102 - location
    l000-173 - location
    p451 - obj
    p404 - obj
    p165 - obj
    p461 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-781 c000 )
    ( in-city l000-203 c000 )
    ( in-city l000-102 c000 )
    ( in-city l000-173 c000 )
    ( obj-at p451 l000-102 )
    ( obj-at p404 l000-102 )
    ( obj-at p165 l000-102 )
    ( obj-at p461 l000-102 )
  )
  ( :goal
    ( and
      ( obj-at p451 l000-000 )
      ( obj-at p404 l000-000 )
      ( obj-at p165 l000-000 )
      ( obj-at p461 l000-000 )
    )
  )
)
