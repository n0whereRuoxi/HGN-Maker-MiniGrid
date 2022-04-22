( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-11 - location
    l000-498 - location
    l000-671 - location
    l000-626 - location
    l000-731 - location
    p116 - obj
    p489 - obj
    p542 - obj
    p342 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-11 c000 )
    ( in-city l000-498 c000 )
    ( in-city l000-671 c000 )
    ( in-city l000-626 c000 )
    ( in-city l000-731 c000 )
    ( obj-at p116 l000-498 )
    ( obj-at p489 l000-11 )
    ( obj-at p542 l000-498 )
    ( obj-at p342 l000-731 )
  )
  ( :goal
    ( and
      ( obj-at p116 l000-000 )
      ( obj-at p489 l000-000 )
      ( obj-at p542 l000-000 )
      ( obj-at p342 l000-000 )
    )
  )
)
