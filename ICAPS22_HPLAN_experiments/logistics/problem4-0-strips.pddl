( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-110 - location
    l000-294 - location
    l000-720 - location
    l000-555 - location
    l000-515 - location
    l000-856 - location
    p773 - obj
    p529 - obj
    p535 - obj
    p571 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-110 c000 )
    ( in-city l000-294 c000 )
    ( in-city l000-720 c000 )
    ( in-city l000-555 c000 )
    ( in-city l000-515 c000 )
    ( in-city l000-856 c000 )
    ( obj-at p773 l000-856 )
    ( obj-at p529 l000-856 )
    ( obj-at p535 l000-856 )
    ( obj-at p571 l000-856 )
  )
  ( :goal
    ( and
      ( obj-at p773 l000-000 )
      ( obj-at p529 l000-000 )
      ( obj-at p535 l000-000 )
      ( obj-at p571 l000-000 )
    )
  )
)
