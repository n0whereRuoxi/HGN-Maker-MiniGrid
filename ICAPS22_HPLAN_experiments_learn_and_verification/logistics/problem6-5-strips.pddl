( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-259 - location
    l000-205 - location
    l000-682 - location
    l000-611 - location
    l000-192 - location
    l000-818 - location
    l000-18 - location
    l000-9 - location
    l000-524 - location
    l000-152 - location
    p335 - obj
    p856 - obj
    p273 - obj
    p192 - obj
    p867 - obj
    p733 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-259 c000 )
    ( in-city l000-205 c000 )
    ( in-city l000-682 c000 )
    ( in-city l000-611 c000 )
    ( in-city l000-192 c000 )
    ( in-city l000-818 c000 )
    ( in-city l000-18 c000 )
    ( in-city l000-9 c000 )
    ( in-city l000-524 c000 )
    ( in-city l000-152 c000 )
    ( obj-at p335 l000-9 )
    ( obj-at p856 l000-18 )
    ( obj-at p273 l000-682 )
    ( obj-at p192 l000-259 )
    ( obj-at p867 l000-259 )
    ( obj-at p733 l000-192 )
  )
  ( :goal
    ( and
      ( obj-at p335 l000-000 )
      ( obj-at p856 l000-000 )
      ( obj-at p273 l000-000 )
      ( obj-at p192 l000-000 )
      ( obj-at p867 l000-000 )
      ( obj-at p733 l000-000 )
    )
  )
)
