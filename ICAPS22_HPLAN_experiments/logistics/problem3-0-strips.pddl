( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-926 - location
    l000-52 - location
    l000-835 - location
    l000-825 - location
    l000-638 - location
    l000-311 - location
    p926 - obj
    p825 - obj
    p926 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-926 c000 )
    ( in-city l000-52 c000 )
    ( in-city l000-835 c000 )
    ( in-city l000-825 c000 )
    ( in-city l000-638 c000 )
    ( in-city l000-311 c000 )
    ( obj-at p926 l000-926 )
    ( obj-at p825 l000-825 )
    ( obj-at p926 l000-926 )
  )
  ( :goal
    ( and
      ( obj-at p926 l000-000 )
      ( obj-at p825 l000-000 )
      ( obj-at p926 l000-000 )
    )
  )
)
