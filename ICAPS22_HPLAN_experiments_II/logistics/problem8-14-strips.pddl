( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-181 - location
    l000-914 - location
    l000-629 - location
    l000-149 - location
    l000-680 - location
    l000-53 - location
    l000-232 - location
    l000-881 - location
    l000-786 - location
    l000-769 - location
    l000-776 - location
    l000-2 - location
    l000-428 - location
    l000-666 - location
    p340 - obj
    p768 - obj
    p865 - obj
    p73 - obj
    p707 - obj
    p871 - obj
    p405 - obj
    p580 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-181 c000 )
    ( in-city l000-914 c000 )
    ( in-city l000-629 c000 )
    ( in-city l000-149 c000 )
    ( in-city l000-680 c000 )
    ( in-city l000-53 c000 )
    ( in-city l000-232 c000 )
    ( in-city l000-881 c000 )
    ( in-city l000-786 c000 )
    ( in-city l000-769 c000 )
    ( in-city l000-776 c000 )
    ( in-city l000-2 c000 )
    ( in-city l000-428 c000 )
    ( in-city l000-666 c000 )
    ( obj-at p340 l000-776 )
    ( obj-at p768 l000-666 )
    ( obj-at p865 l000-2 )
    ( obj-at p73 l000-149 )
    ( obj-at p707 l000-680 )
    ( obj-at p871 l000-53 )
    ( obj-at p405 l000-2 )
    ( obj-at p580 l000-769 )
  )
  ( :goal
    ( and
      ( obj-at p340 l000-000 )
      ( obj-at p768 l000-000 )
      ( obj-at p865 l000-000 )
      ( obj-at p73 l000-000 )
      ( obj-at p707 l000-000 )
      ( obj-at p871 l000-000 )
      ( obj-at p405 l000-000 )
      ( obj-at p580 l000-000 )
    )
  )
)
