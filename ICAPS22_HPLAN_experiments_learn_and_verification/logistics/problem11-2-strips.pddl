( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-455 - location
    l000-353 - location
    l000-911 - location
    l000-853 - location
    l000-155 - location
    l000-870 - location
    p362 - obj
    p269 - obj
    p344 - obj
    p324 - obj
    p829 - obj
    p769 - obj
    p822 - obj
    p150 - obj
    p491 - obj
    p26 - obj
    p119 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-455 c000 )
    ( in-city l000-353 c000 )
    ( in-city l000-911 c000 )
    ( in-city l000-853 c000 )
    ( in-city l000-155 c000 )
    ( in-city l000-870 c000 )
    ( obj-at p362 l000-870 )
    ( obj-at p269 l000-911 )
    ( obj-at p344 l000-911 )
    ( obj-at p324 l000-455 )
    ( obj-at p829 l000-853 )
    ( obj-at p769 l000-353 )
    ( obj-at p822 l000-853 )
    ( obj-at p150 l000-911 )
    ( obj-at p491 l000-911 )
    ( obj-at p26 l000-353 )
    ( obj-at p119 l000-853 )
  )
  ( :goal
    ( and
      ( obj-at p362 l000-000 )
      ( obj-at p269 l000-000 )
      ( obj-at p344 l000-000 )
      ( obj-at p324 l000-000 )
      ( obj-at p829 l000-000 )
      ( obj-at p769 l000-000 )
      ( obj-at p822 l000-000 )
      ( obj-at p150 l000-000 )
      ( obj-at p491 l000-000 )
      ( obj-at p26 l000-000 )
      ( obj-at p119 l000-000 )
    )
  )
)
