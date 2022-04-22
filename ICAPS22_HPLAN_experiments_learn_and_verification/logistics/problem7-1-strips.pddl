( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-105 - location
    l000-312 - location
    l000-261 - location
    l000-788 - location
    l000-385 - location
    l000-532 - location
    l000-176 - location
    l000-989 - location
    l000-786 - location
    l000-660 - location
    p237 - obj
    p646 - obj
    p639 - obj
    p141 - obj
    p529 - obj
    p316 - obj
    p190 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-105 c000 )
    ( in-city l000-312 c000 )
    ( in-city l000-261 c000 )
    ( in-city l000-788 c000 )
    ( in-city l000-385 c000 )
    ( in-city l000-532 c000 )
    ( in-city l000-176 c000 )
    ( in-city l000-989 c000 )
    ( in-city l000-786 c000 )
    ( in-city l000-660 c000 )
    ( obj-at p237 l000-176 )
    ( obj-at p646 l000-786 )
    ( obj-at p639 l000-660 )
    ( obj-at p141 l000-989 )
    ( obj-at p529 l000-788 )
    ( obj-at p316 l000-989 )
    ( obj-at p190 l000-385 )
  )
  ( :goal
    ( and
      ( obj-at p237 l000-000 )
      ( obj-at p646 l000-000 )
      ( obj-at p639 l000-000 )
      ( obj-at p141 l000-000 )
      ( obj-at p529 l000-000 )
      ( obj-at p316 l000-000 )
      ( obj-at p190 l000-000 )
    )
  )
)
