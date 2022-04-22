( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-384 - location
    l000-541 - location
    l000-877 - location
    l000-454 - location
    l000-297 - location
    l000-568 - location
    l000-831 - location
    l000-913 - location
    l000-646 - location
    l000-848 - location
    p623 - obj
    p762 - obj
    p185 - obj
    p625 - obj
    p616 - obj
    p274 - obj
    p72 - obj
    p703 - obj
    p507 - obj
    p660 - obj
    p291 - obj
    p840 - obj
    p23 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-384 c000 )
    ( in-city l000-541 c000 )
    ( in-city l000-877 c000 )
    ( in-city l000-454 c000 )
    ( in-city l000-297 c000 )
    ( in-city l000-568 c000 )
    ( in-city l000-831 c000 )
    ( in-city l000-913 c000 )
    ( in-city l000-646 c000 )
    ( in-city l000-848 c000 )
    ( obj-at p623 l000-877 )
    ( obj-at p762 l000-568 )
    ( obj-at p185 l000-297 )
    ( obj-at p625 l000-384 )
    ( obj-at p616 l000-913 )
    ( obj-at p274 l000-541 )
    ( obj-at p72 l000-877 )
    ( obj-at p703 l000-831 )
    ( obj-at p507 l000-831 )
    ( obj-at p660 l000-568 )
    ( obj-at p291 l000-831 )
    ( obj-at p840 l000-877 )
    ( obj-at p23 l000-913 )
  )
  ( :goal
    ( and
      ( obj-at p623 l000-000 )
      ( obj-at p762 l000-000 )
      ( obj-at p185 l000-000 )
      ( obj-at p625 l000-000 )
      ( obj-at p616 l000-000 )
      ( obj-at p274 l000-000 )
      ( obj-at p72 l000-000 )
      ( obj-at p703 l000-000 )
      ( obj-at p507 l000-000 )
      ( obj-at p660 l000-000 )
      ( obj-at p291 l000-000 )
      ( obj-at p840 l000-000 )
      ( obj-at p23 l000-000 )
    )
  )
)
