( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-195 - location
    l000-708 - location
    l000-323 - location
    l000-951 - location
    p978 - obj
    p503 - obj
    p420 - obj
    p324 - obj
    p984 - obj
    p579 - obj
    p350 - obj
    p975 - obj
    p360 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-195 c000 )
    ( in-city l000-708 c000 )
    ( in-city l000-323 c000 )
    ( in-city l000-951 c000 )
    ( obj-at p978 l000-708 )
    ( obj-at p503 l000-951 )
    ( obj-at p420 l000-951 )
    ( obj-at p324 l000-323 )
    ( obj-at p984 l000-951 )
    ( obj-at p579 l000-708 )
    ( obj-at p350 l000-195 )
    ( obj-at p975 l000-195 )
    ( obj-at p360 l000-951 )
  )
  ( :goal
    ( and
      ( obj-at p978 l000-000 )
      ( obj-at p503 l000-000 )
      ( obj-at p420 l000-000 )
      ( obj-at p324 l000-000 )
      ( obj-at p984 l000-000 )
      ( obj-at p579 l000-000 )
      ( obj-at p350 l000-000 )
      ( obj-at p975 l000-000 )
      ( obj-at p360 l000-000 )
    )
  )
)
