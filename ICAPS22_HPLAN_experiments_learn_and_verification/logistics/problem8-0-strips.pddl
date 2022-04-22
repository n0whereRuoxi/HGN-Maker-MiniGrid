( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-433 - location
    l000-611 - location
    l000-547 - location
    l000-802 - location
    l000-112 - location
    l000-644 - location
    l000-305 - location
    l000-179 - location
    l000-395 - location
    l000-398 - location
    l000-950 - location
    p357 - obj
    p18 - obj
    p821 - obj
    p146 - obj
    p824 - obj
    p899 - obj
    p200 - obj
    p656 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-433 c000 )
    ( in-city l000-611 c000 )
    ( in-city l000-547 c000 )
    ( in-city l000-802 c000 )
    ( in-city l000-112 c000 )
    ( in-city l000-644 c000 )
    ( in-city l000-305 c000 )
    ( in-city l000-179 c000 )
    ( in-city l000-395 c000 )
    ( in-city l000-398 c000 )
    ( in-city l000-950 c000 )
    ( obj-at p357 l000-305 )
    ( obj-at p18 l000-611 )
    ( obj-at p821 l000-398 )
    ( obj-at p146 l000-802 )
    ( obj-at p824 l000-112 )
    ( obj-at p899 l000-398 )
    ( obj-at p200 l000-950 )
    ( obj-at p656 l000-398 )
  )
  ( :goal
    ( and
      ( obj-at p357 l000-000 )
      ( obj-at p18 l000-000 )
      ( obj-at p821 l000-000 )
      ( obj-at p146 l000-000 )
      ( obj-at p824 l000-000 )
      ( obj-at p899 l000-000 )
      ( obj-at p200 l000-000 )
      ( obj-at p656 l000-000 )
    )
  )
)
