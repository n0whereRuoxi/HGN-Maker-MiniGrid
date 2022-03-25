( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-938 - location
    l000-557 - location
    l000-786 - location
    l000-826 - location
    l000-171 - location
    l000-51 - location
    l000-209 - location
    l000-661 - location
    l000-822 - location
    l000-923 - location
    p453 - obj
    p541 - obj
    p448 - obj
    p814 - obj
    p54 - obj
    p146 - obj
    p587 - obj
    p663 - obj
    p381 - obj
    p661 - obj
    p510 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-938 c000 )
    ( in-city l000-557 c000 )
    ( in-city l000-786 c000 )
    ( in-city l000-826 c000 )
    ( in-city l000-171 c000 )
    ( in-city l000-51 c000 )
    ( in-city l000-209 c000 )
    ( in-city l000-661 c000 )
    ( in-city l000-822 c000 )
    ( in-city l000-923 c000 )
    ( obj-at p453 l000-786 )
    ( obj-at p541 l000-51 )
    ( obj-at p448 l000-938 )
    ( obj-at p814 l000-923 )
    ( obj-at p54 l000-786 )
    ( obj-at p146 l000-826 )
    ( obj-at p587 l000-51 )
    ( obj-at p663 l000-938 )
    ( obj-at p381 l000-826 )
    ( obj-at p661 l000-209 )
    ( obj-at p510 l000-171 )
  )
  ( :goal
    ( and
      ( obj-at p453 l000-000 )
      ( obj-at p541 l000-000 )
      ( obj-at p448 l000-000 )
      ( obj-at p814 l000-000 )
      ( obj-at p54 l000-000 )
      ( obj-at p146 l000-000 )
      ( obj-at p587 l000-000 )
      ( obj-at p663 l000-000 )
      ( obj-at p381 l000-000 )
      ( obj-at p661 l000-000 )
      ( obj-at p510 l000-000 )
    )
  )
)
