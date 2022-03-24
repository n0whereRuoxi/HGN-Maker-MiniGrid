( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-391 - location
    l000-647 - location
    l000-4 - location
    l000-89 - location
    l000-31 - location
    p454 - obj
    p63 - obj
    p584 - obj
    p863 - obj
    p719 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-391 c000 )
    ( in-city l000-647 c000 )
    ( in-city l000-4 c000 )
    ( in-city l000-89 c000 )
    ( in-city l000-31 c000 )
    ( obj-at p454 l000-391 )
    ( obj-at p63 l000-647 )
    ( obj-at p584 l000-31 )
    ( obj-at p863 l000-4 )
    ( obj-at p719 l000-391 )
  )
  ( :goal
    ( and
      ( obj-at p454 l000-000 )
      ( obj-at p63 l000-000 )
      ( obj-at p584 l000-000 )
      ( obj-at p863 l000-000 )
      ( obj-at p719 l000-000 )
    )
  )
)
