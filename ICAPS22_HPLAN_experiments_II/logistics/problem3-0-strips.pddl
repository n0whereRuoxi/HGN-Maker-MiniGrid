( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-446 - location
    l000-872 - location
    l000-261 - location
    l000-482 - location
    p258 - obj
    p544 - obj
    p162 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-446 c000 )
    ( in-city l000-872 c000 )
    ( in-city l000-261 c000 )
    ( in-city l000-482 c000 )
    ( obj-at p258 l000-446 )
    ( obj-at p544 l000-261 )
    ( obj-at p162 l000-482 )
  )
  ( :goal
    ( and
      ( obj-at p258 l000-000 )
      ( obj-at p544 l000-000 )
      ( obj-at p162 l000-000 )
    )
  )
)
