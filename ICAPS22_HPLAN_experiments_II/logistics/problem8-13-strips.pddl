( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-3 - location
    l000-404 - location
    l000-112 - location
    l000-556 - location
    l000-599 - location
    l000-567 - location
    p978 - obj
    p329 - obj
    p504 - obj
    p34 - obj
    p928 - obj
    p798 - obj
    p108 - obj
    p834 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-3 c000 )
    ( in-city l000-404 c000 )
    ( in-city l000-112 c000 )
    ( in-city l000-556 c000 )
    ( in-city l000-599 c000 )
    ( in-city l000-567 c000 )
    ( obj-at p978 l000-3 )
    ( obj-at p329 l000-567 )
    ( obj-at p504 l000-3 )
    ( obj-at p34 l000-556 )
    ( obj-at p928 l000-556 )
    ( obj-at p798 l000-599 )
    ( obj-at p108 l000-404 )
    ( obj-at p834 l000-567 )
  )
  ( :goal
    ( and
      ( obj-at p978 l000-000 )
      ( obj-at p329 l000-000 )
      ( obj-at p504 l000-000 )
      ( obj-at p34 l000-000 )
      ( obj-at p928 l000-000 )
      ( obj-at p798 l000-000 )
      ( obj-at p108 l000-000 )
      ( obj-at p834 l000-000 )
    )
  )
)
