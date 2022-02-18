( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-844 - location
    l000-873 - location
    l000-645 - location
    l000-595 - location
    l000-387 - location
    p94 - obj
    p770 - obj
    p719 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-844 c000 )
    ( in-city l000-873 c000 )
    ( in-city l000-645 c000 )
    ( in-city l000-595 c000 )
    ( in-city l000-387 c000 )
    ( obj-at p94 l000-844 )
    ( obj-at p770 l000-645 )
    ( obj-at p719 l000-387 )
  )
  ( :goal
    ( and
      ( obj-at p94 l000-000 )
      ( obj-at p770 l000-000 )
      ( obj-at p719 l000-000 )
    )
  )
)
