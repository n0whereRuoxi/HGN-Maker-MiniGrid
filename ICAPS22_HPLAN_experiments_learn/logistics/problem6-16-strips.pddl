( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-831 - location
    l000-736 - location
    l000-524 - location
    l000-158 - location
    l000-786 - location
    l000-280 - location
    l000-999 - location
    l000-978 - location
    l000-569 - location
    l000-731 - location
    p790 - obj
    p647 - obj
    p851 - obj
    p719 - obj
    p350 - obj
    p528 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-831 c000 )
    ( in-city l000-736 c000 )
    ( in-city l000-524 c000 )
    ( in-city l000-158 c000 )
    ( in-city l000-786 c000 )
    ( in-city l000-280 c000 )
    ( in-city l000-999 c000 )
    ( in-city l000-978 c000 )
    ( in-city l000-569 c000 )
    ( in-city l000-731 c000 )
    ( obj-at p790 l000-786 )
    ( obj-at p647 l000-524 )
    ( obj-at p851 l000-831 )
    ( obj-at p719 l000-569 )
    ( obj-at p350 l000-999 )
    ( obj-at p528 l000-731 )
  )
  ( :goal
    ( and
      ( obj-at p790 l000-000 )
      ( obj-at p647 l000-000 )
      ( obj-at p851 l000-000 )
      ( obj-at p719 l000-000 )
      ( obj-at p350 l000-000 )
      ( obj-at p528 l000-000 )
    )
  )
)
