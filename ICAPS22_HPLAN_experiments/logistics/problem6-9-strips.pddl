( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-439 - location
    l000-312 - location
    l000-554 - location
    l000-285 - location
    p477 - obj
    p427 - obj
    p267 - obj
    p921 - obj
    p762 - obj
    p932 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-439 c000 )
    ( in-city l000-312 c000 )
    ( in-city l000-554 c000 )
    ( in-city l000-285 c000 )
    ( obj-at p477 l000-285 )
    ( obj-at p427 l000-312 )
    ( obj-at p267 l000-312 )
    ( obj-at p921 l000-554 )
    ( obj-at p762 l000-439 )
    ( obj-at p932 l000-312 )
  )
  ( :goal
    ( and
      ( obj-at p477 l000-000 )
      ( obj-at p427 l000-000 )
      ( obj-at p267 l000-000 )
      ( obj-at p921 l000-000 )
      ( obj-at p762 l000-000 )
      ( obj-at p932 l000-000 )
    )
  )
)
