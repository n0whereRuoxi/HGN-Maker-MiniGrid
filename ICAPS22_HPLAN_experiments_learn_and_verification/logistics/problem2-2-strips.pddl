( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-562 - location
    l000-600 - location
    l000-997 - location
    p437 - obj
    p395 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-562 c000 )
    ( in-city l000-600 c000 )
    ( in-city l000-997 c000 )
    ( obj-at p437 l000-600 )
    ( obj-at p395 l000-562 )
  )
  ( :goal
    ( and
      ( obj-at p437 l000-000 )
      ( obj-at p395 l000-000 )
    )
  )
)
