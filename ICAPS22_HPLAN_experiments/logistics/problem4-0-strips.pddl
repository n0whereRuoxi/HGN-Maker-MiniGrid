( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-7 - location
    l000-882 - location
    l000-952 - location
    l000-923 - location
    l000-578 - location
    l000-787 - location
    l000-684 - location
    p952 - obj
    p578 - obj
    p684 - obj
    p952 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-7 c000 )
    ( in-city l000-882 c000 )
    ( in-city l000-952 c000 )
    ( in-city l000-923 c000 )
    ( in-city l000-578 c000 )
    ( in-city l000-787 c000 )
    ( in-city l000-684 c000 )
    ( obj-at p952 l000-952 )
    ( obj-at p578 l000-578 )
    ( obj-at p684 l000-684 )
    ( obj-at p952 l000-952 )
  )
  ( :goal
    ( and
      ( obj-at p952 l000-000 )
      ( obj-at p578 l000-000 )
      ( obj-at p684 l000-000 )
      ( obj-at p952 l000-000 )
    )
  )
)
