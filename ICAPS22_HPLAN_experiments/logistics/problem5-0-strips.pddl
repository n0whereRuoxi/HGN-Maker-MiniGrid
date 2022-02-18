( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-829 - location
    l000-608 - location
    l000-34 - location
    l000-397 - location
    p634 - obj
    p260 - obj
    p163 - obj
    p660 - obj
    p89 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-829 c000 )
    ( in-city l000-608 c000 )
    ( in-city l000-34 c000 )
    ( in-city l000-397 c000 )
    ( obj-at p634 l000-608 )
    ( obj-at p260 l000-34 )
    ( obj-at p163 l000-34 )
    ( obj-at p660 l000-34 )
    ( obj-at p89 l000-608 )
  )
  ( :goal
    ( and
      ( obj-at p634 l000-000 )
      ( obj-at p260 l000-000 )
      ( obj-at p163 l000-000 )
      ( obj-at p660 l000-000 )
      ( obj-at p89 l000-000 )
    )
  )
)
