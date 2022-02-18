( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-373 - location
    l000-546 - location
    l000-915 - location
    l000-225 - location
    l000-113 - location
    l000-602 - location
    p804 - obj
    p985 - obj
    p311 - obj
    p353 - obj
    p264 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-373 c000 )
    ( in-city l000-546 c000 )
    ( in-city l000-915 c000 )
    ( in-city l000-225 c000 )
    ( in-city l000-113 c000 )
    ( in-city l000-602 c000 )
    ( obj-at p804 l000-225 )
    ( obj-at p985 l000-546 )
    ( obj-at p311 l000-602 )
    ( obj-at p353 l000-225 )
    ( obj-at p264 l000-602 )
  )
  ( :goal
    ( and
      ( obj-at p804 l000-000 )
      ( obj-at p985 l000-000 )
      ( obj-at p311 l000-000 )
      ( obj-at p353 l000-000 )
      ( obj-at p264 l000-000 )
    )
  )
)
