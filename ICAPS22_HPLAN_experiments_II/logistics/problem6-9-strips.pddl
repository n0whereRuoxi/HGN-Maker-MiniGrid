( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-638 - location
    l000-468 - location
    l000-954 - location
    l000-983 - location
    l000-449 - location
    l000-923 - location
    l000-90 - location
    l000-944 - location
    l000-404 - location
    p482 - obj
    p511 - obj
    p640 - obj
    p428 - obj
    p476 - obj
    p469 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-638 c000 )
    ( in-city l000-468 c000 )
    ( in-city l000-954 c000 )
    ( in-city l000-983 c000 )
    ( in-city l000-449 c000 )
    ( in-city l000-923 c000 )
    ( in-city l000-90 c000 )
    ( in-city l000-944 c000 )
    ( in-city l000-404 c000 )
    ( obj-at p482 l000-90 )
    ( obj-at p511 l000-468 )
    ( obj-at p640 l000-954 )
    ( obj-at p428 l000-638 )
    ( obj-at p476 l000-923 )
    ( obj-at p469 l000-983 )
  )
  ( :goal
    ( and
      ( obj-at p482 l000-000 )
      ( obj-at p511 l000-000 )
      ( obj-at p640 l000-000 )
      ( obj-at p428 l000-000 )
      ( obj-at p476 l000-000 )
      ( obj-at p469 l000-000 )
    )
  )
)
