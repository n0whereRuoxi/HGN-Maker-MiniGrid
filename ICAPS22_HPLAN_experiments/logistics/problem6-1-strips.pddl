( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-417 - location
    l000-753 - location
    l000-452 - location
    l000-579 - location
    l000-464 - location
    p533 - obj
    p203 - obj
    p39 - obj
    p181 - obj
    p688 - obj
    p690 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-417 c000 )
    ( in-city l000-753 c000 )
    ( in-city l000-452 c000 )
    ( in-city l000-579 c000 )
    ( in-city l000-464 c000 )
    ( obj-at p533 l000-452 )
    ( obj-at p203 l000-579 )
    ( obj-at p39 l000-579 )
    ( obj-at p181 l000-579 )
    ( obj-at p688 l000-579 )
    ( obj-at p690 l000-417 )
  )
  ( :goal
    ( and
      ( obj-at p533 l000-000 )
      ( obj-at p203 l000-000 )
      ( obj-at p39 l000-000 )
      ( obj-at p181 l000-000 )
      ( obj-at p688 l000-000 )
      ( obj-at p690 l000-000 )
    )
  )
)
