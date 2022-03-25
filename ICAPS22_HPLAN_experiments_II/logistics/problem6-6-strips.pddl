( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-963 - location
    l000-609 - location
    l000-564 - location
    l000-530 - location
    l000-677 - location
    l000-403 - location
    l000-167 - location
    l000-213 - location
    l000-829 - location
    l000-269 - location
    p679 - obj
    p4 - obj
    p29 - obj
    p361 - obj
    p857 - obj
    p238 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-963 c000 )
    ( in-city l000-609 c000 )
    ( in-city l000-564 c000 )
    ( in-city l000-530 c000 )
    ( in-city l000-677 c000 )
    ( in-city l000-403 c000 )
    ( in-city l000-167 c000 )
    ( in-city l000-213 c000 )
    ( in-city l000-829 c000 )
    ( in-city l000-269 c000 )
    ( obj-at p679 l000-213 )
    ( obj-at p4 l000-609 )
    ( obj-at p29 l000-829 )
    ( obj-at p361 l000-963 )
    ( obj-at p857 l000-564 )
    ( obj-at p238 l000-167 )
  )
  ( :goal
    ( and
      ( obj-at p679 l000-000 )
      ( obj-at p4 l000-000 )
      ( obj-at p29 l000-000 )
      ( obj-at p361 l000-000 )
      ( obj-at p857 l000-000 )
      ( obj-at p238 l000-000 )
    )
  )
)
