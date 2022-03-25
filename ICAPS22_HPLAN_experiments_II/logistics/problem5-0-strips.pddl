( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-855 - location
    l000-738 - location
    l000-893 - location
    l000-801 - location
    l000-777 - location
    p328 - obj
    p381 - obj
    p305 - obj
    p975 - obj
    p584 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-855 c000 )
    ( in-city l000-738 c000 )
    ( in-city l000-893 c000 )
    ( in-city l000-801 c000 )
    ( in-city l000-777 c000 )
    ( obj-at p328 l000-738 )
    ( obj-at p381 l000-738 )
    ( obj-at p305 l000-801 )
    ( obj-at p975 l000-893 )
    ( obj-at p584 l000-893 )
  )
  ( :goal
    ( and
      ( obj-at p328 l000-000 )
      ( obj-at p381 l000-000 )
      ( obj-at p305 l000-000 )
      ( obj-at p975 l000-000 )
      ( obj-at p584 l000-000 )
    )
  )
)
