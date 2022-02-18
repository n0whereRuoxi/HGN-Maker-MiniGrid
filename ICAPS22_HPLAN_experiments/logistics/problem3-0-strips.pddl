( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-448 - location
    l000-574 - location
    l000-669 - location
    l000-434 - location
    p477 - obj
    p994 - obj
    p248 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-448 c000 )
    ( in-city l000-574 c000 )
    ( in-city l000-669 c000 )
    ( in-city l000-434 c000 )
    ( obj-at p477 l000-669 )
    ( obj-at p994 l000-434 )
    ( obj-at p248 l000-448 )
  )
  ( :goal
    ( and
      ( obj-at p477 l000-000 )
      ( obj-at p994 l000-000 )
      ( obj-at p248 l000-000 )
    )
  )
)
