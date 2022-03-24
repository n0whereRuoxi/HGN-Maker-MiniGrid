( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-440 - location
    l000-4 - location
    l000-885 - location
    l000-144 - location
    l000-925 - location
    l000-437 - location
    l000-177 - location
    l000-708 - location
    l000-595 - location
    l000-852 - location
    p581 - obj
    p411 - obj
    p264 - obj
    p159 - obj
    p893 - obj
    p672 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-440 c000 )
    ( in-city l000-4 c000 )
    ( in-city l000-885 c000 )
    ( in-city l000-144 c000 )
    ( in-city l000-925 c000 )
    ( in-city l000-437 c000 )
    ( in-city l000-177 c000 )
    ( in-city l000-708 c000 )
    ( in-city l000-595 c000 )
    ( in-city l000-852 c000 )
    ( obj-at p581 l000-925 )
    ( obj-at p411 l000-177 )
    ( obj-at p264 l000-177 )
    ( obj-at p159 l000-440 )
    ( obj-at p893 l000-177 )
    ( obj-at p672 l000-885 )
  )
  ( :goal
    ( and
      ( obj-at p581 l000-000 )
      ( obj-at p411 l000-000 )
      ( obj-at p264 l000-000 )
      ( obj-at p159 l000-000 )
      ( obj-at p893 l000-000 )
      ( obj-at p672 l000-000 )
    )
  )
)
