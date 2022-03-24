( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-741 - location
    l000-241 - location
    l000-107 - location
    l000-667 - location
    l000-829 - location
    l000-285 - location
    l000-470 - location
    p41 - obj
    p121 - obj
    p831 - obj
    p507 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-741 c000 )
    ( in-city l000-241 c000 )
    ( in-city l000-107 c000 )
    ( in-city l000-667 c000 )
    ( in-city l000-829 c000 )
    ( in-city l000-285 c000 )
    ( in-city l000-470 c000 )
    ( obj-at p41 l000-285 )
    ( obj-at p121 l000-470 )
    ( obj-at p831 l000-667 )
    ( obj-at p507 l000-741 )
  )
  ( :goal
    ( and
      ( obj-at p41 l000-000 )
      ( obj-at p121 l000-000 )
      ( obj-at p831 l000-000 )
      ( obj-at p507 l000-000 )
    )
  )
)
