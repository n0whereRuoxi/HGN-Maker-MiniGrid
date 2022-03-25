( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-350 - location
    l000-938 - location
    l000-18 - location
    l000-610 - location
    l000-550 - location
    l000-48 - location
    l000-709 - location
    l000-828 - location
    l000-53 - location
    l000-186 - location
    l000-695 - location
    p286 - obj
    p154 - obj
    p344 - obj
    p748 - obj
    p445 - obj
    p854 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-350 c000 )
    ( in-city l000-938 c000 )
    ( in-city l000-18 c000 )
    ( in-city l000-610 c000 )
    ( in-city l000-550 c000 )
    ( in-city l000-48 c000 )
    ( in-city l000-709 c000 )
    ( in-city l000-828 c000 )
    ( in-city l000-53 c000 )
    ( in-city l000-186 c000 )
    ( in-city l000-695 c000 )
    ( obj-at p286 l000-695 )
    ( obj-at p154 l000-186 )
    ( obj-at p344 l000-709 )
    ( obj-at p748 l000-709 )
    ( obj-at p445 l000-18 )
    ( obj-at p854 l000-610 )
  )
  ( :goal
    ( and
      ( obj-at p286 l000-000 )
      ( obj-at p154 l000-000 )
      ( obj-at p344 l000-000 )
      ( obj-at p748 l000-000 )
      ( obj-at p445 l000-000 )
      ( obj-at p854 l000-000 )
    )
  )
)
