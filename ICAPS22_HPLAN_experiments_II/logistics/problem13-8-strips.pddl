( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-494 - location
    l000-274 - location
    l000-681 - location
    l000-56 - location
    l000-371 - location
    l000-212 - location
    l000-468 - location
    l000-171 - location
    l000-464 - location
    l000-448 - location
    l000-55 - location
    l000-33 - location
    l000-480 - location
    p912 - obj
    p580 - obj
    p622 - obj
    p388 - obj
    p797 - obj
    p416 - obj
    p21 - obj
    p250 - obj
    p488 - obj
    p274 - obj
    p337 - obj
    p204 - obj
    p236 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-494 c000 )
    ( in-city l000-274 c000 )
    ( in-city l000-681 c000 )
    ( in-city l000-56 c000 )
    ( in-city l000-371 c000 )
    ( in-city l000-212 c000 )
    ( in-city l000-468 c000 )
    ( in-city l000-171 c000 )
    ( in-city l000-464 c000 )
    ( in-city l000-448 c000 )
    ( in-city l000-55 c000 )
    ( in-city l000-33 c000 )
    ( in-city l000-480 c000 )
    ( obj-at p912 l000-274 )
    ( obj-at p580 l000-171 )
    ( obj-at p622 l000-33 )
    ( obj-at p388 l000-212 )
    ( obj-at p797 l000-468 )
    ( obj-at p416 l000-464 )
    ( obj-at p21 l000-171 )
    ( obj-at p250 l000-681 )
    ( obj-at p488 l000-480 )
    ( obj-at p274 l000-448 )
    ( obj-at p337 l000-212 )
    ( obj-at p204 l000-494 )
    ( obj-at p236 l000-55 )
  )
  ( :goal
    ( and
      ( obj-at p912 l000-000 )
      ( obj-at p580 l000-000 )
      ( obj-at p622 l000-000 )
      ( obj-at p388 l000-000 )
      ( obj-at p797 l000-000 )
      ( obj-at p416 l000-000 )
      ( obj-at p21 l000-000 )
      ( obj-at p250 l000-000 )
      ( obj-at p488 l000-000 )
      ( obj-at p274 l000-000 )
      ( obj-at p337 l000-000 )
      ( obj-at p204 l000-000 )
      ( obj-at p236 l000-000 )
    )
  )
)
