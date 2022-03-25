( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-701 - location
    l000-182 - location
    l000-725 - location
    l000-820 - location
    l000-406 - location
    l000-604 - location
    l000-403 - location
    p301 - obj
    p536 - obj
    p293 - obj
    p987 - obj
    p652 - obj
    p696 - obj
    p273 - obj
    p245 - obj
    p602 - obj
    p9 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-701 c000 )
    ( in-city l000-182 c000 )
    ( in-city l000-725 c000 )
    ( in-city l000-820 c000 )
    ( in-city l000-406 c000 )
    ( in-city l000-604 c000 )
    ( in-city l000-403 c000 )
    ( obj-at p301 l000-403 )
    ( obj-at p536 l000-820 )
    ( obj-at p293 l000-406 )
    ( obj-at p987 l000-725 )
    ( obj-at p652 l000-701 )
    ( obj-at p696 l000-403 )
    ( obj-at p273 l000-725 )
    ( obj-at p245 l000-820 )
    ( obj-at p602 l000-406 )
    ( obj-at p9 l000-403 )
  )
  ( :goal
    ( and
      ( obj-at p301 l000-000 )
      ( obj-at p536 l000-000 )
      ( obj-at p293 l000-000 )
      ( obj-at p987 l000-000 )
      ( obj-at p652 l000-000 )
      ( obj-at p696 l000-000 )
      ( obj-at p273 l000-000 )
      ( obj-at p245 l000-000 )
      ( obj-at p602 l000-000 )
      ( obj-at p9 l000-000 )
    )
  )
)
