( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-604 - location
    l000-415 - location
    l000-868 - location
    l000-200 - location
    l000-400 - location
    l000-852 - location
    l000-535 - location
    l000-125 - location
    l000-219 - location
    l000-371 - location
    l000-790 - location
    l000-164 - location
    l000-193 - location
    p138 - obj
    p932 - obj
    p515 - obj
    p441 - obj
    p641 - obj
    p603 - obj
    p385 - obj
    p305 - obj
    p13 - obj
    p817 - obj
    p279 - obj
    p5 - obj
    p654 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-604 c000 )
    ( in-city l000-415 c000 )
    ( in-city l000-868 c000 )
    ( in-city l000-200 c000 )
    ( in-city l000-400 c000 )
    ( in-city l000-852 c000 )
    ( in-city l000-535 c000 )
    ( in-city l000-125 c000 )
    ( in-city l000-219 c000 )
    ( in-city l000-371 c000 )
    ( in-city l000-790 c000 )
    ( in-city l000-164 c000 )
    ( in-city l000-193 c000 )
    ( obj-at p138 l000-868 )
    ( obj-at p932 l000-852 )
    ( obj-at p515 l000-535 )
    ( obj-at p441 l000-852 )
    ( obj-at p641 l000-415 )
    ( obj-at p603 l000-200 )
    ( obj-at p385 l000-604 )
    ( obj-at p305 l000-415 )
    ( obj-at p13 l000-535 )
    ( obj-at p817 l000-868 )
    ( obj-at p279 l000-400 )
    ( obj-at p5 l000-371 )
    ( obj-at p654 l000-790 )
  )
  ( :goal
    ( and
      ( obj-at p138 l000-000 )
      ( obj-at p932 l000-000 )
      ( obj-at p515 l000-000 )
      ( obj-at p441 l000-000 )
      ( obj-at p641 l000-000 )
      ( obj-at p603 l000-000 )
      ( obj-at p385 l000-000 )
      ( obj-at p305 l000-000 )
      ( obj-at p13 l000-000 )
      ( obj-at p817 l000-000 )
      ( obj-at p279 l000-000 )
      ( obj-at p5 l000-000 )
      ( obj-at p654 l000-000 )
    )
  )
)
