( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-978 - location
    l000-589 - location
    l000-595 - location
    l000-817 - location
    l000-216 - location
    l000-873 - location
    p843 - obj
    p680 - obj
    p576 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-978 c000 )
    ( in-city l000-589 c000 )
    ( in-city l000-595 c000 )
    ( in-city l000-817 c000 )
    ( in-city l000-216 c000 )
    ( in-city l000-873 c000 )
    ( obj-at p843 l000-595 )
    ( obj-at p680 l000-589 )
    ( obj-at p576 l000-978 )
  )
  ( :goal
    ( and
      ( obj-at p843 l000-000 )
      ( obj-at p680 l000-000 )
      ( obj-at p576 l000-000 )
    )
  )
)
