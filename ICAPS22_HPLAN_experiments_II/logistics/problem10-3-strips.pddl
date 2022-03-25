( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-578 - location
    l000-510 - location
    l000-705 - location
    l000-689 - location
    l000-891 - location
    p694 - obj
    p5 - obj
    p528 - obj
    p923 - obj
    p103 - obj
    p779 - obj
    p196 - obj
    p111 - obj
    p32 - obj
    p201 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-578 c000 )
    ( in-city l000-510 c000 )
    ( in-city l000-705 c000 )
    ( in-city l000-689 c000 )
    ( in-city l000-891 c000 )
    ( obj-at p694 l000-510 )
    ( obj-at p5 l000-689 )
    ( obj-at p528 l000-705 )
    ( obj-at p923 l000-510 )
    ( obj-at p103 l000-510 )
    ( obj-at p779 l000-891 )
    ( obj-at p196 l000-578 )
    ( obj-at p111 l000-510 )
    ( obj-at p32 l000-578 )
    ( obj-at p201 l000-689 )
  )
  ( :goal
    ( and
      ( obj-at p694 l000-000 )
      ( obj-at p5 l000-000 )
      ( obj-at p528 l000-000 )
      ( obj-at p923 l000-000 )
      ( obj-at p103 l000-000 )
      ( obj-at p779 l000-000 )
      ( obj-at p196 l000-000 )
      ( obj-at p111 l000-000 )
      ( obj-at p32 l000-000 )
      ( obj-at p201 l000-000 )
    )
  )
)
