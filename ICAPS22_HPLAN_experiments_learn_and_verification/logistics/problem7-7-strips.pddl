( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-273 - location
    l000-173 - location
    l000-15 - location
    l000-97 - location
    l000-608 - location
    l000-569 - location
    l000-568 - location
    l000-655 - location
    l000-41 - location
    l000-257 - location
    l000-456 - location
    l000-263 - location
    p440 - obj
    p306 - obj
    p296 - obj
    p418 - obj
    p962 - obj
    p213 - obj
    p47 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-273 c000 )
    ( in-city l000-173 c000 )
    ( in-city l000-15 c000 )
    ( in-city l000-97 c000 )
    ( in-city l000-608 c000 )
    ( in-city l000-569 c000 )
    ( in-city l000-568 c000 )
    ( in-city l000-655 c000 )
    ( in-city l000-41 c000 )
    ( in-city l000-257 c000 )
    ( in-city l000-456 c000 )
    ( in-city l000-263 c000 )
    ( obj-at p440 l000-257 )
    ( obj-at p306 l000-273 )
    ( obj-at p296 l000-15 )
    ( obj-at p418 l000-569 )
    ( obj-at p962 l000-257 )
    ( obj-at p213 l000-655 )
    ( obj-at p47 l000-569 )
  )
  ( :goal
    ( and
      ( obj-at p440 l000-000 )
      ( obj-at p306 l000-000 )
      ( obj-at p296 l000-000 )
      ( obj-at p418 l000-000 )
      ( obj-at p962 l000-000 )
      ( obj-at p213 l000-000 )
      ( obj-at p47 l000-000 )
    )
  )
)
