( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-4 - location
    l000-935 - location
    l000-443 - location
    l000-41 - location
    l000-142 - location
    l000-489 - location
    l000-724 - location
    l000-678 - location
    l000-343 - location
    p774 - obj
    p743 - obj
    p144 - obj
    p50 - obj
    p628 - obj
    p462 - obj
    p928 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-4 c000 )
    ( in-city l000-935 c000 )
    ( in-city l000-443 c000 )
    ( in-city l000-41 c000 )
    ( in-city l000-142 c000 )
    ( in-city l000-489 c000 )
    ( in-city l000-724 c000 )
    ( in-city l000-678 c000 )
    ( in-city l000-343 c000 )
    ( obj-at p774 l000-343 )
    ( obj-at p743 l000-678 )
    ( obj-at p144 l000-343 )
    ( obj-at p50 l000-343 )
    ( obj-at p628 l000-678 )
    ( obj-at p462 l000-678 )
    ( obj-at p928 l000-489 )
  )
  ( :goal
    ( and
      ( obj-at p774 l000-000 )
      ( obj-at p743 l000-000 )
      ( obj-at p144 l000-000 )
      ( obj-at p50 l000-000 )
      ( obj-at p628 l000-000 )
      ( obj-at p462 l000-000 )
      ( obj-at p928 l000-000 )
    )
  )
)
