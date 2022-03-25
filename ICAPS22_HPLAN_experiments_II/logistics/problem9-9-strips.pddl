( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-608 - location
    l000-906 - location
    l000-927 - location
    l000-990 - location
    l000-390 - location
    l000-579 - location
    p608 - obj
    p692 - obj
    p753 - obj
    p905 - obj
    p986 - obj
    p877 - obj
    p177 - obj
    p312 - obj
    p426 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-608 c000 )
    ( in-city l000-906 c000 )
    ( in-city l000-927 c000 )
    ( in-city l000-990 c000 )
    ( in-city l000-390 c000 )
    ( in-city l000-579 c000 )
    ( obj-at p608 l000-390 )
    ( obj-at p692 l000-990 )
    ( obj-at p753 l000-579 )
    ( obj-at p905 l000-390 )
    ( obj-at p986 l000-390 )
    ( obj-at p877 l000-579 )
    ( obj-at p177 l000-579 )
    ( obj-at p312 l000-906 )
    ( obj-at p426 l000-390 )
  )
  ( :goal
    ( and
      ( obj-at p608 l000-000 )
      ( obj-at p692 l000-000 )
      ( obj-at p753 l000-000 )
      ( obj-at p905 l000-000 )
      ( obj-at p986 l000-000 )
      ( obj-at p877 l000-000 )
      ( obj-at p177 l000-000 )
      ( obj-at p312 l000-000 )
      ( obj-at p426 l000-000 )
    )
  )
)
