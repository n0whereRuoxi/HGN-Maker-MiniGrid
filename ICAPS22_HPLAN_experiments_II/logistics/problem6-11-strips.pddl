( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-631 - location
    l000-543 - location
    l000-515 - location
    l000-545 - location
    l000-567 - location
    l000-664 - location
    l000-905 - location
    l000-9 - location
    l000-876 - location
    l000-916 - location
    p205 - obj
    p574 - obj
    p816 - obj
    p207 - obj
    p446 - obj
    p319 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-631 c000 )
    ( in-city l000-543 c000 )
    ( in-city l000-515 c000 )
    ( in-city l000-545 c000 )
    ( in-city l000-567 c000 )
    ( in-city l000-664 c000 )
    ( in-city l000-905 c000 )
    ( in-city l000-9 c000 )
    ( in-city l000-876 c000 )
    ( in-city l000-916 c000 )
    ( obj-at p205 l000-631 )
    ( obj-at p574 l000-567 )
    ( obj-at p816 l000-545 )
    ( obj-at p207 l000-631 )
    ( obj-at p446 l000-9 )
    ( obj-at p319 l000-664 )
  )
  ( :goal
    ( and
      ( obj-at p205 l000-000 )
      ( obj-at p574 l000-000 )
      ( obj-at p816 l000-000 )
      ( obj-at p207 l000-000 )
      ( obj-at p446 l000-000 )
      ( obj-at p319 l000-000 )
    )
  )
)
