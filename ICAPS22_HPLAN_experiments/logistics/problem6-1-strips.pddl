( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-521 - location
    l000-791 - location
    l000-202 - location
    l000-935 - location
    l000-582 - location
    l000-970 - location
    l000-565 - location
    l000-196 - location
    l000-992 - location
    p720 - obj
    p161 - obj
    p301 - obj
    p800 - obj
    p32 - obj
    p842 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-521 c000 )
    ( in-city l000-791 c000 )
    ( in-city l000-202 c000 )
    ( in-city l000-935 c000 )
    ( in-city l000-582 c000 )
    ( in-city l000-970 c000 )
    ( in-city l000-565 c000 )
    ( in-city l000-196 c000 )
    ( in-city l000-992 c000 )
    ( obj-at p720 l000-935 )
    ( obj-at p161 l000-935 )
    ( obj-at p301 l000-202 )
    ( obj-at p800 l000-992 )
    ( obj-at p32 l000-196 )
    ( obj-at p842 l000-935 )
  )
  ( :goal
    ( and
      ( obj-at p720 l000-000 )
      ( obj-at p161 l000-000 )
      ( obj-at p301 l000-000 )
      ( obj-at p800 l000-000 )
      ( obj-at p32 l000-000 )
      ( obj-at p842 l000-000 )
    )
  )
)
