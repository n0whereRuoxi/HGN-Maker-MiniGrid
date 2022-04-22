( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-740 - location
    l000-801 - location
    l000-596 - location
    p42 - obj
    p272 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-740 c000 )
    ( in-city l000-801 c000 )
    ( in-city l000-596 c000 )
    ( obj-at p42 l000-740 )
    ( obj-at p272 l000-596 )
  )
  ( :goal
    ( and
      ( obj-at p42 l000-000 )
      ( obj-at p272 l000-000 )
    )
  )
)
