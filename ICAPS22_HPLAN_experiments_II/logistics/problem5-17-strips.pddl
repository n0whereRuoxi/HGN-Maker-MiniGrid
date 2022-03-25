( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-355 - location
    l000-787 - location
    l000-252 - location
    l000-23 - location
    l000-491 - location
    l000-754 - location
    l000-406 - location
    l000-413 - location
    l000-662 - location
    p749 - obj
    p984 - obj
    p887 - obj
    p583 - obj
    p546 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-355 c000 )
    ( in-city l000-787 c000 )
    ( in-city l000-252 c000 )
    ( in-city l000-23 c000 )
    ( in-city l000-491 c000 )
    ( in-city l000-754 c000 )
    ( in-city l000-406 c000 )
    ( in-city l000-413 c000 )
    ( in-city l000-662 c000 )
    ( obj-at p749 l000-491 )
    ( obj-at p984 l000-491 )
    ( obj-at p887 l000-413 )
    ( obj-at p583 l000-491 )
    ( obj-at p546 l000-23 )
  )
  ( :goal
    ( and
      ( obj-at p749 l000-000 )
      ( obj-at p984 l000-000 )
      ( obj-at p887 l000-000 )
      ( obj-at p583 l000-000 )
      ( obj-at p546 l000-000 )
    )
  )
)
