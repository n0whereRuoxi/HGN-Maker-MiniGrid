( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-800 - location
    l000-333 - location
    l000-259 - location
    l000-570 - location
    l000-242 - location
    l000-238 - location
    l000-821 - location
    l000-367 - location
    p763 - obj
    p887 - obj
    p949 - obj
    p653 - obj
    p429 - obj
    p787 - obj
    p193 - obj
    p805 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-800 c000 )
    ( in-city l000-333 c000 )
    ( in-city l000-259 c000 )
    ( in-city l000-570 c000 )
    ( in-city l000-242 c000 )
    ( in-city l000-238 c000 )
    ( in-city l000-821 c000 )
    ( in-city l000-367 c000 )
    ( obj-at p763 l000-333 )
    ( obj-at p887 l000-800 )
    ( obj-at p949 l000-259 )
    ( obj-at p653 l000-570 )
    ( obj-at p429 l000-570 )
    ( obj-at p787 l000-367 )
    ( obj-at p193 l000-259 )
    ( obj-at p805 l000-570 )
  )
  ( :goal
    ( and
      ( obj-at p763 l000-000 )
      ( obj-at p887 l000-000 )
      ( obj-at p949 l000-000 )
      ( obj-at p653 l000-000 )
      ( obj-at p429 l000-000 )
      ( obj-at p787 l000-000 )
      ( obj-at p193 l000-000 )
      ( obj-at p805 l000-000 )
    )
  )
)
