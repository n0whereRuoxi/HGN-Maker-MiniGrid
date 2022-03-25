( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-787 - location
    l000-783 - location
    l000-820 - location
    l000-863 - location
    l000-176 - location
    l000-481 - location
    p335 - obj
    p648 - obj
    p534 - obj
    p39 - obj
    p47 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-787 c000 )
    ( in-city l000-783 c000 )
    ( in-city l000-820 c000 )
    ( in-city l000-863 c000 )
    ( in-city l000-176 c000 )
    ( in-city l000-481 c000 )
    ( obj-at p335 l000-176 )
    ( obj-at p648 l000-783 )
    ( obj-at p534 l000-176 )
    ( obj-at p39 l000-481 )
    ( obj-at p47 l000-783 )
  )
  ( :goal
    ( and
      ( obj-at p335 l000-000 )
      ( obj-at p648 l000-000 )
      ( obj-at p534 l000-000 )
      ( obj-at p39 l000-000 )
      ( obj-at p47 l000-000 )
    )
  )
)
