( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-402 - location
    l000-35 - location
    l000-33 - location
    l000-620 - location
    l000-747 - location
    l000-930 - location
    p90 - obj
    p747 - obj
    p532 - obj
    p66 - obj
    p296 - obj
    p506 - obj
    p873 - obj
    p889 - obj
    p564 - obj
    p998 - obj
    p988 - obj
    p886 - obj
    p604 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-402 c000 )
    ( in-city l000-35 c000 )
    ( in-city l000-33 c000 )
    ( in-city l000-620 c000 )
    ( in-city l000-747 c000 )
    ( in-city l000-930 c000 )
    ( obj-at p90 l000-35 )
    ( obj-at p747 l000-747 )
    ( obj-at p532 l000-620 )
    ( obj-at p66 l000-930 )
    ( obj-at p296 l000-33 )
    ( obj-at p506 l000-620 )
    ( obj-at p873 l000-35 )
    ( obj-at p889 l000-747 )
    ( obj-at p564 l000-35 )
    ( obj-at p998 l000-747 )
    ( obj-at p988 l000-620 )
    ( obj-at p886 l000-747 )
    ( obj-at p604 l000-35 )
  )
  ( :goal
    ( and
      ( obj-at p90 l000-000 )
      ( obj-at p747 l000-000 )
      ( obj-at p532 l000-000 )
      ( obj-at p66 l000-000 )
      ( obj-at p296 l000-000 )
      ( obj-at p506 l000-000 )
      ( obj-at p873 l000-000 )
      ( obj-at p889 l000-000 )
      ( obj-at p564 l000-000 )
      ( obj-at p998 l000-000 )
      ( obj-at p988 l000-000 )
      ( obj-at p886 l000-000 )
      ( obj-at p604 l000-000 )
    )
  )
)
