( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-507 - location
    l000-881 - location
    l000-501 - location
    l000-689 - location
    l000-942 - location
    l000-503 - location
    p602 - obj
    p651 - obj
    p293 - obj
    p163 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-507 c000 )
    ( in-city l000-881 c000 )
    ( in-city l000-501 c000 )
    ( in-city l000-689 c000 )
    ( in-city l000-942 c000 )
    ( in-city l000-503 c000 )
    ( obj-at p602 l000-881 )
    ( obj-at p651 l000-501 )
    ( obj-at p293 l000-507 )
    ( obj-at p163 l000-942 )
  )
  ( :goal
    ( and
      ( obj-at p602 l000-000 )
      ( obj-at p651 l000-000 )
      ( obj-at p293 l000-000 )
      ( obj-at p163 l000-000 )
    )
  )
)
