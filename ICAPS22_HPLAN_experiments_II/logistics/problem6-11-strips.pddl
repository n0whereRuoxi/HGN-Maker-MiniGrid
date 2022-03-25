( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-470 - location
    l000-253 - location
    l000-147 - location
    l000-829 - location
    l000-917 - location
    l000-328 - location
    l000-823 - location
    p18 - obj
    p782 - obj
    p146 - obj
    p298 - obj
    p785 - obj
    p331 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-470 c000 )
    ( in-city l000-253 c000 )
    ( in-city l000-147 c000 )
    ( in-city l000-829 c000 )
    ( in-city l000-917 c000 )
    ( in-city l000-328 c000 )
    ( in-city l000-823 c000 )
    ( obj-at p18 l000-328 )
    ( obj-at p782 l000-470 )
    ( obj-at p146 l000-253 )
    ( obj-at p298 l000-253 )
    ( obj-at p785 l000-253 )
    ( obj-at p331 l000-253 )
  )
  ( :goal
    ( and
      ( obj-at p18 l000-000 )
      ( obj-at p782 l000-000 )
      ( obj-at p146 l000-000 )
      ( obj-at p298 l000-000 )
      ( obj-at p785 l000-000 )
      ( obj-at p331 l000-000 )
    )
  )
)
