( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-549 - location
    l000-856 - location
    l000-392 - location
    l000-81 - location
    l000-139 - location
    l000-27 - location
    p97 - obj
    p918 - obj
    p75 - obj
    p189 - obj
    p423 - obj
    p549 - obj
    p672 - obj
    p689 - obj
    p128 - obj
    p317 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-549 c000 )
    ( in-city l000-856 c000 )
    ( in-city l000-392 c000 )
    ( in-city l000-81 c000 )
    ( in-city l000-139 c000 )
    ( in-city l000-27 c000 )
    ( obj-at p97 l000-139 )
    ( obj-at p918 l000-549 )
    ( obj-at p75 l000-392 )
    ( obj-at p189 l000-81 )
    ( obj-at p423 l000-81 )
    ( obj-at p549 l000-549 )
    ( obj-at p672 l000-139 )
    ( obj-at p689 l000-856 )
    ( obj-at p128 l000-549 )
    ( obj-at p317 l000-81 )
  )
  ( :goal
    ( and
      ( obj-at p97 l000-000 )
      ( obj-at p918 l000-000 )
      ( obj-at p75 l000-000 )
      ( obj-at p189 l000-000 )
      ( obj-at p423 l000-000 )
      ( obj-at p549 l000-000 )
      ( obj-at p672 l000-000 )
      ( obj-at p689 l000-000 )
      ( obj-at p128 l000-000 )
      ( obj-at p317 l000-000 )
    )
  )
)
