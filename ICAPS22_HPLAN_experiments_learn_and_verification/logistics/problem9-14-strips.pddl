( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-754 - location
    l000-137 - location
    l000-672 - location
    l000-771 - location
    l000-795 - location
    p362 - obj
    p106 - obj
    p711 - obj
    p232 - obj
    p26 - obj
    p499 - obj
    p307 - obj
    p816 - obj
    p11 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-754 c000 )
    ( in-city l000-137 c000 )
    ( in-city l000-672 c000 )
    ( in-city l000-771 c000 )
    ( in-city l000-795 c000 )
    ( obj-at p362 l000-137 )
    ( obj-at p106 l000-771 )
    ( obj-at p711 l000-771 )
    ( obj-at p232 l000-771 )
    ( obj-at p26 l000-672 )
    ( obj-at p499 l000-137 )
    ( obj-at p307 l000-771 )
    ( obj-at p816 l000-771 )
    ( obj-at p11 l000-754 )
  )
  ( :goal
    ( and
      ( obj-at p362 l000-000 )
      ( obj-at p106 l000-000 )
      ( obj-at p711 l000-000 )
      ( obj-at p232 l000-000 )
      ( obj-at p26 l000-000 )
      ( obj-at p499 l000-000 )
      ( obj-at p307 l000-000 )
      ( obj-at p816 l000-000 )
      ( obj-at p11 l000-000 )
    )
  )
)
