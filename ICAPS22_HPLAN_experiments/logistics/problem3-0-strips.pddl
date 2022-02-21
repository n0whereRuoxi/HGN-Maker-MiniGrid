( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-61 - location
    l000-668 - location
    l000-232 - location
    l000-442 - location
    p652 - obj
    p964 - obj
    p450 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-61 c000 )
    ( in-city l000-668 c000 )
    ( in-city l000-232 c000 )
    ( in-city l000-442 c000 )
    ( obj-at p652 l000-442 )
    ( obj-at p964 l000-61 )
    ( obj-at p450 l000-668 )
  )
  ( :goal
    ( and
      ( obj-at p652 l000-000 )
      ( obj-at p964 l000-000 )
      ( obj-at p450 l000-000 )
    )
  )
)
