( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-230 - location
    l000-799 - location
    l000-850 - location
    l000-288 - location
    l000-799 - location
    l000-38 - location
    l000-67 - location
    l000-626 - location
    l000-549 - location
    l000-27 - location
    l000-804 - location
    l000-922 - location
    p288 - obj
    p288 - obj
    p922 - obj
    p38 - obj
    p626 - obj
    p626 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-230 c000 )
    ( in-city l000-799 c000 )
    ( in-city l000-850 c000 )
    ( in-city l000-288 c000 )
    ( in-city l000-799 c000 )
    ( in-city l000-38 c000 )
    ( in-city l000-67 c000 )
    ( in-city l000-626 c000 )
    ( in-city l000-549 c000 )
    ( in-city l000-27 c000 )
    ( in-city l000-804 c000 )
    ( in-city l000-922 c000 )
    ( obj-at p288 l000-288 )
    ( obj-at p288 l000-288 )
    ( obj-at p922 l000-922 )
    ( obj-at p38 l000-38 )
    ( obj-at p626 l000-626 )
    ( obj-at p626 l000-626 )
  )
  ( :goal
    ( and
      ( obj-at p288 l000-000 )
      ( obj-at p288 l000-000 )
      ( obj-at p922 l000-000 )
      ( obj-at p38 l000-000 )
      ( obj-at p626 l000-000 )
      ( obj-at p626 l000-000 )
    )
  )
)
