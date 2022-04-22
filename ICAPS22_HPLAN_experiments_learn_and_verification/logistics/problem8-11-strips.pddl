( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-918 - location
    l000-31 - location
    l000-506 - location
    l000-869 - location
    l000-14 - location
    l000-877 - location
    l000-741 - location
    l000-963 - location
    l000-26 - location
    p352 - obj
    p658 - obj
    p685 - obj
    p588 - obj
    p605 - obj
    p367 - obj
    p872 - obj
    p166 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-918 c000 )
    ( in-city l000-31 c000 )
    ( in-city l000-506 c000 )
    ( in-city l000-869 c000 )
    ( in-city l000-14 c000 )
    ( in-city l000-877 c000 )
    ( in-city l000-741 c000 )
    ( in-city l000-963 c000 )
    ( in-city l000-26 c000 )
    ( obj-at p352 l000-963 )
    ( obj-at p658 l000-26 )
    ( obj-at p685 l000-506 )
    ( obj-at p588 l000-869 )
    ( obj-at p605 l000-506 )
    ( obj-at p367 l000-741 )
    ( obj-at p872 l000-877 )
    ( obj-at p166 l000-26 )
  )
  ( :goal
    ( and
      ( obj-at p352 l000-000 )
      ( obj-at p658 l000-000 )
      ( obj-at p685 l000-000 )
      ( obj-at p588 l000-000 )
      ( obj-at p605 l000-000 )
      ( obj-at p367 l000-000 )
      ( obj-at p872 l000-000 )
      ( obj-at p166 l000-000 )
    )
  )
)
