( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-218 - location
    l000-251 - location
    l000-622 - location
    l000-373 - location
    l000-795 - location
    l000-594 - location
    l000-768 - location
    l000-869 - location
    l000-807 - location
    l000-723 - location
    l000-50 - location
    l000-460 - location
    l000-8 - location
    l000-211 - location
    l000-10 - location
    l000-589 - location
    l000-526 - location
    l000-738 - location
    l000-765 - location
    l000-875 - location
    p766 - obj
    p712 - obj
    p632 - obj
    p124 - obj
    p499 - obj
    p82 - obj
    p514 - obj
    p168 - obj
    p895 - obj
    p648 - obj
    p744 - obj
    p417 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-218 c000 )
    ( in-city l000-251 c000 )
    ( in-city l000-622 c000 )
    ( in-city l000-373 c000 )
    ( in-city l000-795 c000 )
    ( in-city l000-594 c000 )
    ( in-city l000-768 c000 )
    ( in-city l000-869 c000 )
    ( in-city l000-807 c000 )
    ( in-city l000-723 c000 )
    ( in-city l000-50 c000 )
    ( in-city l000-460 c000 )
    ( in-city l000-8 c000 )
    ( in-city l000-211 c000 )
    ( in-city l000-10 c000 )
    ( in-city l000-589 c000 )
    ( in-city l000-526 c000 )
    ( in-city l000-738 c000 )
    ( in-city l000-765 c000 )
    ( in-city l000-875 c000 )
    ( obj-at p766 l000-589 )
    ( obj-at p712 l000-768 )
    ( obj-at p632 l000-50 )
    ( obj-at p124 l000-373 )
    ( obj-at p499 l000-768 )
    ( obj-at p82 l000-594 )
    ( obj-at p514 l000-875 )
    ( obj-at p168 l000-589 )
    ( obj-at p895 l000-460 )
    ( obj-at p648 l000-622 )
    ( obj-at p744 l000-795 )
    ( obj-at p417 l000-795 )
  )
  ( :goal
    ( and
      ( obj-at p766 l000-000 )
      ( obj-at p712 l000-000 )
      ( obj-at p632 l000-000 )
      ( obj-at p124 l000-000 )
      ( obj-at p499 l000-000 )
      ( obj-at p82 l000-000 )
      ( obj-at p514 l000-000 )
      ( obj-at p168 l000-000 )
      ( obj-at p895 l000-000 )
      ( obj-at p648 l000-000 )
      ( obj-at p744 l000-000 )
      ( obj-at p417 l000-000 )
    )
  )
)
