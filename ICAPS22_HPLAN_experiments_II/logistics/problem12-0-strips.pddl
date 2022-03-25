( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-644 - location
    l000-832 - location
    l000-962 - location
    l000-201 - location
    l000-905 - location
    l000-292 - location
    l000-225 - location
    l000-785 - location
    l000-782 - location
    l000-20 - location
    l000-819 - location
    l000-703 - location
    l000-143 - location
    l000-190 - location
    l000-835 - location
    l000-214 - location
    p603 - obj
    p747 - obj
    p82 - obj
    p264 - obj
    p759 - obj
    p116 - obj
    p633 - obj
    p124 - obj
    p710 - obj
    p222 - obj
    p997 - obj
    p200 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-644 c000 )
    ( in-city l000-832 c000 )
    ( in-city l000-962 c000 )
    ( in-city l000-201 c000 )
    ( in-city l000-905 c000 )
    ( in-city l000-292 c000 )
    ( in-city l000-225 c000 )
    ( in-city l000-785 c000 )
    ( in-city l000-782 c000 )
    ( in-city l000-20 c000 )
    ( in-city l000-819 c000 )
    ( in-city l000-703 c000 )
    ( in-city l000-143 c000 )
    ( in-city l000-190 c000 )
    ( in-city l000-835 c000 )
    ( in-city l000-214 c000 )
    ( obj-at p603 l000-292 )
    ( obj-at p747 l000-201 )
    ( obj-at p82 l000-644 )
    ( obj-at p264 l000-214 )
    ( obj-at p759 l000-832 )
    ( obj-at p116 l000-835 )
    ( obj-at p633 l000-832 )
    ( obj-at p124 l000-201 )
    ( obj-at p710 l000-214 )
    ( obj-at p222 l000-819 )
    ( obj-at p997 l000-292 )
    ( obj-at p200 l000-292 )
  )
  ( :goal
    ( and
      ( obj-at p603 l000-000 )
      ( obj-at p747 l000-000 )
      ( obj-at p82 l000-000 )
      ( obj-at p264 l000-000 )
      ( obj-at p759 l000-000 )
      ( obj-at p116 l000-000 )
      ( obj-at p633 l000-000 )
      ( obj-at p124 l000-000 )
      ( obj-at p710 l000-000 )
      ( obj-at p222 l000-000 )
      ( obj-at p997 l000-000 )
      ( obj-at p200 l000-000 )
    )
  )
)
