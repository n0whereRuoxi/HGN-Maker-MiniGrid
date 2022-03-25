( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-291 - location
    l000-756 - location
    l000-118 - location
    p467 - obj
    p263 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-291 c000 )
    ( in-city l000-756 c000 )
    ( in-city l000-118 c000 )
    ( obj-at p467 l000-291 )
    ( obj-at p263 l000-118 )
  )
  ( :goal
    ( and
      ( obj-at p467 l000-000 )
      ( obj-at p263 l000-000 )
    )
  )
)
