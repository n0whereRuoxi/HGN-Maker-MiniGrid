( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-325 - location
    l000-497 - location
    l000-56 - location
    l000-305 - location
    l000-152 - location
    l000-769 - location
    l000-411 - location
    l000-8 - location
    p554 - obj
    p878 - obj
    p237 - obj
    p960 - obj
    p815 - obj
    p687 - obj
    p761 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-325 c000 )
    ( in-city l000-497 c000 )
    ( in-city l000-56 c000 )
    ( in-city l000-305 c000 )
    ( in-city l000-152 c000 )
    ( in-city l000-769 c000 )
    ( in-city l000-411 c000 )
    ( in-city l000-8 c000 )
    ( obj-at p554 l000-305 )
    ( obj-at p878 l000-769 )
    ( obj-at p237 l000-497 )
    ( obj-at p960 l000-8 )
    ( obj-at p815 l000-305 )
    ( obj-at p687 l000-411 )
    ( obj-at p761 l000-497 )
  )
  ( :goal
    ( and
      ( obj-at p554 l000-000 )
      ( obj-at p878 l000-000 )
      ( obj-at p237 l000-000 )
      ( obj-at p960 l000-000 )
      ( obj-at p815 l000-000 )
      ( obj-at p687 l000-000 )
      ( obj-at p761 l000-000 )
    )
  )
)
