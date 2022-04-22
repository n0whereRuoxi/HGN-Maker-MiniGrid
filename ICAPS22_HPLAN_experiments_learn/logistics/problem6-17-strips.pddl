( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-331 - location
    l000-541 - location
    l000-328 - location
    l000-89 - location
    l000-970 - location
    l000-256 - location
    l000-651 - location
    l000-854 - location
    p326 - obj
    p875 - obj
    p494 - obj
    p186 - obj
    p431 - obj
    p926 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-331 c000 )
    ( in-city l000-541 c000 )
    ( in-city l000-328 c000 )
    ( in-city l000-89 c000 )
    ( in-city l000-970 c000 )
    ( in-city l000-256 c000 )
    ( in-city l000-651 c000 )
    ( in-city l000-854 c000 )
    ( obj-at p326 l000-541 )
    ( obj-at p875 l000-651 )
    ( obj-at p494 l000-651 )
    ( obj-at p186 l000-970 )
    ( obj-at p431 l000-89 )
    ( obj-at p926 l000-651 )
  )
  ( :goal
    ( and
      ( obj-at p326 l000-000 )
      ( obj-at p875 l000-000 )
      ( obj-at p494 l000-000 )
      ( obj-at p186 l000-000 )
      ( obj-at p431 l000-000 )
      ( obj-at p926 l000-000 )
    )
  )
)
