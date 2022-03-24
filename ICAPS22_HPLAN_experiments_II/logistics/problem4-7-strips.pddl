( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-443 - location
    l000-990 - location
    l000-314 - location
    l000-412 - location
    l000-144 - location
    l000-114 - location
    l000-59 - location
    p283 - obj
    p992 - obj
    p462 - obj
    p226 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-443 c000 )
    ( in-city l000-990 c000 )
    ( in-city l000-314 c000 )
    ( in-city l000-412 c000 )
    ( in-city l000-144 c000 )
    ( in-city l000-114 c000 )
    ( in-city l000-59 c000 )
    ( obj-at p283 l000-412 )
    ( obj-at p992 l000-443 )
    ( obj-at p462 l000-114 )
    ( obj-at p226 l000-144 )
  )
  ( :goal
    ( and
      ( obj-at p283 l000-000 )
      ( obj-at p992 l000-000 )
      ( obj-at p462 l000-000 )
      ( obj-at p226 l000-000 )
    )
  )
)
