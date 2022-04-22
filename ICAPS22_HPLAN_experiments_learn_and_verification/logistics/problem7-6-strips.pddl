( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-49 - location
    l000-600 - location
    l000-250 - location
    l000-986 - location
    l000-455 - location
    l000-460 - location
    l000-341 - location
    l000-504 - location
    l000-874 - location
    l000-909 - location
    l000-795 - location
    l000-984 - location
    l000-471 - location
    l000-571 - location
    p159 - obj
    p745 - obj
    p955 - obj
    p197 - obj
    p639 - obj
    p172 - obj
    p65 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-49 c000 )
    ( in-city l000-600 c000 )
    ( in-city l000-250 c000 )
    ( in-city l000-986 c000 )
    ( in-city l000-455 c000 )
    ( in-city l000-460 c000 )
    ( in-city l000-341 c000 )
    ( in-city l000-504 c000 )
    ( in-city l000-874 c000 )
    ( in-city l000-909 c000 )
    ( in-city l000-795 c000 )
    ( in-city l000-984 c000 )
    ( in-city l000-471 c000 )
    ( in-city l000-571 c000 )
    ( obj-at p159 l000-600 )
    ( obj-at p745 l000-986 )
    ( obj-at p955 l000-250 )
    ( obj-at p197 l000-471 )
    ( obj-at p639 l000-460 )
    ( obj-at p172 l000-504 )
    ( obj-at p65 l000-909 )
  )
  ( :goal
    ( and
      ( obj-at p159 l000-000 )
      ( obj-at p745 l000-000 )
      ( obj-at p955 l000-000 )
      ( obj-at p197 l000-000 )
      ( obj-at p639 l000-000 )
      ( obj-at p172 l000-000 )
      ( obj-at p65 l000-000 )
    )
  )
)
