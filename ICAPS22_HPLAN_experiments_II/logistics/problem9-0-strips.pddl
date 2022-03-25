( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-722 - location
    l000-521 - location
    l000-585 - location
    l000-896 - location
    l000-238 - location
    l000-961 - location
    l000-103 - location
    l000-608 - location
    l000-154 - location
    l000-724 - location
    l000-297 - location
    p932 - obj
    p649 - obj
    p412 - obj
    p590 - obj
    p13 - obj
    p595 - obj
    p32 - obj
    p750 - obj
    p331 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-722 c000 )
    ( in-city l000-521 c000 )
    ( in-city l000-585 c000 )
    ( in-city l000-896 c000 )
    ( in-city l000-238 c000 )
    ( in-city l000-961 c000 )
    ( in-city l000-103 c000 )
    ( in-city l000-608 c000 )
    ( in-city l000-154 c000 )
    ( in-city l000-724 c000 )
    ( in-city l000-297 c000 )
    ( obj-at p932 l000-585 )
    ( obj-at p649 l000-585 )
    ( obj-at p412 l000-961 )
    ( obj-at p590 l000-722 )
    ( obj-at p13 l000-154 )
    ( obj-at p595 l000-238 )
    ( obj-at p32 l000-724 )
    ( obj-at p750 l000-521 )
    ( obj-at p331 l000-297 )
  )
  ( :goal
    ( and
      ( obj-at p932 l000-000 )
      ( obj-at p649 l000-000 )
      ( obj-at p412 l000-000 )
      ( obj-at p590 l000-000 )
      ( obj-at p13 l000-000 )
      ( obj-at p595 l000-000 )
      ( obj-at p32 l000-000 )
      ( obj-at p750 l000-000 )
      ( obj-at p331 l000-000 )
    )
  )
)
