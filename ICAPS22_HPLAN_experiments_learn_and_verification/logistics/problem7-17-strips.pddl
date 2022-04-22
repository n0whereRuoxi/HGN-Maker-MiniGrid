( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-740 - location
    l000-429 - location
    l000-752 - location
    l000-460 - location
    l000-687 - location
    l000-352 - location
    l000-925 - location
    l000-259 - location
    l000-423 - location
    l000-725 - location
    l000-526 - location
    p901 - obj
    p975 - obj
    p36 - obj
    p335 - obj
    p832 - obj
    p926 - obj
    p864 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-740 c000 )
    ( in-city l000-429 c000 )
    ( in-city l000-752 c000 )
    ( in-city l000-460 c000 )
    ( in-city l000-687 c000 )
    ( in-city l000-352 c000 )
    ( in-city l000-925 c000 )
    ( in-city l000-259 c000 )
    ( in-city l000-423 c000 )
    ( in-city l000-725 c000 )
    ( in-city l000-526 c000 )
    ( obj-at p901 l000-752 )
    ( obj-at p975 l000-925 )
    ( obj-at p36 l000-526 )
    ( obj-at p335 l000-725 )
    ( obj-at p832 l000-752 )
    ( obj-at p926 l000-423 )
    ( obj-at p864 l000-526 )
  )
  ( :goal
    ( and
      ( obj-at p901 l000-000 )
      ( obj-at p975 l000-000 )
      ( obj-at p36 l000-000 )
      ( obj-at p335 l000-000 )
      ( obj-at p832 l000-000 )
      ( obj-at p926 l000-000 )
      ( obj-at p864 l000-000 )
    )
  )
)
