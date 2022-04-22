( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-970 - location
    l000-902 - location
    l000-561 - location
    p652 - obj
    p295 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-970 c000 )
    ( in-city l000-902 c000 )
    ( in-city l000-561 c000 )
    ( obj-at p652 l000-970 )
    ( obj-at p295 l000-970 )
  )
  ( :goal
    ( and
      ( obj-at p652 l000-000 )
      ( obj-at p295 l000-000 )
    )
  )
)
