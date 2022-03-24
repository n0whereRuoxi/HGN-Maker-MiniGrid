( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-395 - location
    l000-746 - location
    l000-939 - location
    l000-598 - location
    l000-698 - location
    l000-53 - location
    p609 - obj
    p424 - obj
    p798 - obj
    p299 - obj
    p206 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-395 c000 )
    ( in-city l000-746 c000 )
    ( in-city l000-939 c000 )
    ( in-city l000-598 c000 )
    ( in-city l000-698 c000 )
    ( in-city l000-53 c000 )
    ( obj-at p609 l000-53 )
    ( obj-at p424 l000-746 )
    ( obj-at p798 l000-395 )
    ( obj-at p299 l000-939 )
    ( obj-at p206 l000-53 )
  )
  ( :goal
    ( and
      ( obj-at p609 l000-000 )
      ( obj-at p424 l000-000 )
      ( obj-at p798 l000-000 )
      ( obj-at p299 l000-000 )
      ( obj-at p206 l000-000 )
    )
  )
)
