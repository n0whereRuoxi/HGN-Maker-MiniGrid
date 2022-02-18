( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-880 - location
    p880 - obj
    p880 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-880 c000 )
    ( obj-at p880 l000-880 )
    ( obj-at p880 l000-880 )
  )
  ( :goal
    ( and
      ( obj-at p880 l000-000 )
      ( obj-at p880 l000-000 )
    )
  )
)
