( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-119 - location
    l000-988 - location
    l000-513 - location
    l000-135 - location
    p962 - obj
    p28 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-119 c000 )
    ( in-city l000-988 c000 )
    ( in-city l000-513 c000 )
    ( in-city l000-135 c000 )
    ( obj-at p962 l000-119 )
    ( obj-at p28 l000-513 )
  )
  ( :goal
    ( and
      ( obj-at p962 l000-000 )
      ( obj-at p28 l000-000 )
    )
  )
)
