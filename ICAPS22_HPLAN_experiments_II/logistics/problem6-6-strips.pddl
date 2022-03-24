( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-147 - location
    l000-329 - location
    l000-32 - location
    l000-159 - location
    p391 - obj
    p830 - obj
    p836 - obj
    p474 - obj
    p57 - obj
    p570 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-147 c000 )
    ( in-city l000-329 c000 )
    ( in-city l000-32 c000 )
    ( in-city l000-159 c000 )
    ( obj-at p391 l000-32 )
    ( obj-at p830 l000-159 )
    ( obj-at p836 l000-329 )
    ( obj-at p474 l000-32 )
    ( obj-at p57 l000-147 )
    ( obj-at p570 l000-159 )
  )
  ( :goal
    ( and
      ( obj-at p391 l000-000 )
      ( obj-at p830 l000-000 )
      ( obj-at p836 l000-000 )
      ( obj-at p474 l000-000 )
      ( obj-at p57 l000-000 )
      ( obj-at p570 l000-000 )
    )
  )
)
