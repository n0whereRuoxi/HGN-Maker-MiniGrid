( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-208 - location
    l000-967 - location
    l000-168 - location
    l000-541 - location
    p539 - obj
    p387 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-208 c000 )
    ( in-city l000-967 c000 )
    ( in-city l000-168 c000 )
    ( in-city l000-541 c000 )
    ( obj-at p539 l000-967 )
    ( obj-at p387 l000-168 )
  )
  ( :goal
    ( and
      ( obj-at p539 l000-000 )
      ( obj-at p387 l000-000 )
    )
  )
)
