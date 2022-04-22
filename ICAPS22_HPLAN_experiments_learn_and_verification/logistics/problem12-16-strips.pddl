( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-732 - location
    l000-807 - location
    l000-292 - location
    l000-915 - location
    l000-127 - location
    l000-499 - location
    l000-681 - location
    p231 - obj
    p382 - obj
    p291 - obj
    p983 - obj
    p47 - obj
    p362 - obj
    p769 - obj
    p798 - obj
    p533 - obj
    p746 - obj
    p963 - obj
    p718 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-732 c000 )
    ( in-city l000-807 c000 )
    ( in-city l000-292 c000 )
    ( in-city l000-915 c000 )
    ( in-city l000-127 c000 )
    ( in-city l000-499 c000 )
    ( in-city l000-681 c000 )
    ( obj-at p231 l000-915 )
    ( obj-at p382 l000-292 )
    ( obj-at p291 l000-732 )
    ( obj-at p983 l000-292 )
    ( obj-at p47 l000-732 )
    ( obj-at p362 l000-499 )
    ( obj-at p769 l000-127 )
    ( obj-at p798 l000-127 )
    ( obj-at p533 l000-292 )
    ( obj-at p746 l000-292 )
    ( obj-at p963 l000-915 )
    ( obj-at p718 l000-292 )
  )
  ( :goal
    ( and
      ( obj-at p231 l000-000 )
      ( obj-at p382 l000-000 )
      ( obj-at p291 l000-000 )
      ( obj-at p983 l000-000 )
      ( obj-at p47 l000-000 )
      ( obj-at p362 l000-000 )
      ( obj-at p769 l000-000 )
      ( obj-at p798 l000-000 )
      ( obj-at p533 l000-000 )
      ( obj-at p746 l000-000 )
      ( obj-at p963 l000-000 )
      ( obj-at p718 l000-000 )
    )
  )
)
