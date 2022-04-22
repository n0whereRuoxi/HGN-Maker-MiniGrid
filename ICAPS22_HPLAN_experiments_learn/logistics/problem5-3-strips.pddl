( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-446 - location
    l000-343 - location
    p754 - obj
    p804 - obj
    p774 - obj
    p435 - obj
    p180 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-446 c000 )
    ( in-city l000-343 c000 )
    ( obj-at p754 l000-343 )
    ( obj-at p804 l000-343 )
    ( obj-at p774 l000-446 )
    ( obj-at p435 l000-343 )
    ( obj-at p180 l000-446 )
  )
  ( :goal
    ( and
      ( obj-at p754 l000-000 )
      ( obj-at p804 l000-000 )
      ( obj-at p774 l000-000 )
      ( obj-at p435 l000-000 )
      ( obj-at p180 l000-000 )
    )
  )
)
