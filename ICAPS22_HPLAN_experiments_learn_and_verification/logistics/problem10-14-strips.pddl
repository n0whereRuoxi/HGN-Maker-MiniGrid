( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-775 - location
    l000-42 - location
    l000-912 - location
    l000-488 - location
    l000-603 - location
    l000-662 - location
    l000-570 - location
    l000-299 - location
    l000-409 - location
    l000-857 - location
    l000-40 - location
    l000-673 - location
    l000-44 - location
    l000-68 - location
    l000-685 - location
    l000-383 - location
    l000-959 - location
    l000-31 - location
    l000-477 - location
    l000-858 - location
    p212 - obj
    p755 - obj
    p541 - obj
    p298 - obj
    p231 - obj
    p832 - obj
    p799 - obj
    p114 - obj
    p185 - obj
    p234 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-775 c000 )
    ( in-city l000-42 c000 )
    ( in-city l000-912 c000 )
    ( in-city l000-488 c000 )
    ( in-city l000-603 c000 )
    ( in-city l000-662 c000 )
    ( in-city l000-570 c000 )
    ( in-city l000-299 c000 )
    ( in-city l000-409 c000 )
    ( in-city l000-857 c000 )
    ( in-city l000-40 c000 )
    ( in-city l000-673 c000 )
    ( in-city l000-44 c000 )
    ( in-city l000-68 c000 )
    ( in-city l000-685 c000 )
    ( in-city l000-383 c000 )
    ( in-city l000-959 c000 )
    ( in-city l000-31 c000 )
    ( in-city l000-477 c000 )
    ( in-city l000-858 c000 )
    ( obj-at p212 l000-662 )
    ( obj-at p755 l000-409 )
    ( obj-at p541 l000-40 )
    ( obj-at p298 l000-858 )
    ( obj-at p231 l000-673 )
    ( obj-at p832 l000-570 )
    ( obj-at p799 l000-673 )
    ( obj-at p114 l000-775 )
    ( obj-at p185 l000-857 )
    ( obj-at p234 l000-383 )
  )
  ( :goal
    ( and
      ( obj-at p212 l000-000 )
      ( obj-at p755 l000-000 )
      ( obj-at p541 l000-000 )
      ( obj-at p298 l000-000 )
      ( obj-at p231 l000-000 )
      ( obj-at p832 l000-000 )
      ( obj-at p799 l000-000 )
      ( obj-at p114 l000-000 )
      ( obj-at p185 l000-000 )
      ( obj-at p234 l000-000 )
    )
  )
)
