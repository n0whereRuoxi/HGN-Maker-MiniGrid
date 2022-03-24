( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-971 - location
    l000-95 - location
    l000-880 - location
    l000-687 - location
    l000-410 - location
    l000-663 - location
    p708 - obj
    p236 - obj
    p403 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-971 c000 )
    ( in-city l000-95 c000 )
    ( in-city l000-880 c000 )
    ( in-city l000-687 c000 )
    ( in-city l000-410 c000 )
    ( in-city l000-663 c000 )
    ( obj-at p708 l000-687 )
    ( obj-at p236 l000-687 )
    ( obj-at p403 l000-971 )
  )
  ( :goal
    ( and
      ( obj-at p708 l000-000 )
      ( obj-at p236 l000-000 )
      ( obj-at p403 l000-000 )
    )
  )
)
