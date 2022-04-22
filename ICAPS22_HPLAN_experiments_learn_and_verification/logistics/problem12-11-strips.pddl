( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-806 - location
    l000-419 - location
    l000-591 - location
    l000-208 - location
    l000-813 - location
    l000-482 - location
    l000-360 - location
    l000-854 - location
    l000-529 - location
    l000-952 - location
    l000-393 - location
    l000-197 - location
    l000-193 - location
    l000-680 - location
    l000-914 - location
    l000-326 - location
    l000-151 - location
    l000-911 - location
    l000-189 - location
    l000-77 - location
    l000-634 - location
    l000-625 - location
    p853 - obj
    p164 - obj
    p112 - obj
    p440 - obj
    p306 - obj
    p743 - obj
    p803 - obj
    p930 - obj
    p810 - obj
    p265 - obj
    p323 - obj
    p974 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-806 c000 )
    ( in-city l000-419 c000 )
    ( in-city l000-591 c000 )
    ( in-city l000-208 c000 )
    ( in-city l000-813 c000 )
    ( in-city l000-482 c000 )
    ( in-city l000-360 c000 )
    ( in-city l000-854 c000 )
    ( in-city l000-529 c000 )
    ( in-city l000-952 c000 )
    ( in-city l000-393 c000 )
    ( in-city l000-197 c000 )
    ( in-city l000-193 c000 )
    ( in-city l000-680 c000 )
    ( in-city l000-914 c000 )
    ( in-city l000-326 c000 )
    ( in-city l000-151 c000 )
    ( in-city l000-911 c000 )
    ( in-city l000-189 c000 )
    ( in-city l000-77 c000 )
    ( in-city l000-634 c000 )
    ( in-city l000-625 c000 )
    ( obj-at p853 l000-813 )
    ( obj-at p164 l000-208 )
    ( obj-at p112 l000-634 )
    ( obj-at p440 l000-77 )
    ( obj-at p306 l000-813 )
    ( obj-at p743 l000-189 )
    ( obj-at p803 l000-151 )
    ( obj-at p930 l000-813 )
    ( obj-at p810 l000-911 )
    ( obj-at p265 l000-208 )
    ( obj-at p323 l000-151 )
    ( obj-at p974 l000-813 )
  )
  ( :goal
    ( and
      ( obj-at p853 l000-000 )
      ( obj-at p164 l000-000 )
      ( obj-at p112 l000-000 )
      ( obj-at p440 l000-000 )
      ( obj-at p306 l000-000 )
      ( obj-at p743 l000-000 )
      ( obj-at p803 l000-000 )
      ( obj-at p930 l000-000 )
      ( obj-at p810 l000-000 )
      ( obj-at p265 l000-000 )
      ( obj-at p323 l000-000 )
      ( obj-at p974 l000-000 )
    )
  )
)
