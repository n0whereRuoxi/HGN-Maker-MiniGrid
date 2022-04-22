( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-265 - location
    l000-150 - location
    l000-293 - location
    l000-421 - location
    l000-331 - location
    l000-433 - location
    p388 - obj
    p719 - obj
    p908 - obj
    p913 - obj
    p962 - obj
    p327 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-265 c000 )
    ( in-city l000-150 c000 )
    ( in-city l000-293 c000 )
    ( in-city l000-421 c000 )
    ( in-city l000-331 c000 )
    ( in-city l000-433 c000 )
    ( obj-at p388 l000-150 )
    ( obj-at p719 l000-293 )
    ( obj-at p908 l000-421 )
    ( obj-at p913 l000-433 )
    ( obj-at p962 l000-433 )
    ( obj-at p327 l000-433 )
  )
  ( :goal
    ( and
      ( obj-at p388 l000-000 )
      ( obj-at p719 l000-000 )
      ( obj-at p908 l000-000 )
      ( obj-at p913 l000-000 )
      ( obj-at p962 l000-000 )
      ( obj-at p327 l000-000 )
    )
  )
)
