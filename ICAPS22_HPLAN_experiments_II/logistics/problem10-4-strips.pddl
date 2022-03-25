( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-989 - location
    l000-812 - location
    l000-209 - location
    l000-41 - location
    l000-160 - location
    l000-345 - location
    l000-99 - location
    l000-310 - location
    l000-337 - location
    l000-82 - location
    p471 - obj
    p415 - obj
    p209 - obj
    p162 - obj
    p476 - obj
    p69 - obj
    p115 - obj
    p499 - obj
    p265 - obj
    p482 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-989 c000 )
    ( in-city l000-812 c000 )
    ( in-city l000-209 c000 )
    ( in-city l000-41 c000 )
    ( in-city l000-160 c000 )
    ( in-city l000-345 c000 )
    ( in-city l000-99 c000 )
    ( in-city l000-310 c000 )
    ( in-city l000-337 c000 )
    ( in-city l000-82 c000 )
    ( obj-at p471 l000-209 )
    ( obj-at p415 l000-209 )
    ( obj-at p209 l000-989 )
    ( obj-at p162 l000-82 )
    ( obj-at p476 l000-82 )
    ( obj-at p69 l000-209 )
    ( obj-at p115 l000-160 )
    ( obj-at p499 l000-310 )
    ( obj-at p265 l000-337 )
    ( obj-at p482 l000-310 )
  )
  ( :goal
    ( and
      ( obj-at p471 l000-000 )
      ( obj-at p415 l000-000 )
      ( obj-at p209 l000-000 )
      ( obj-at p162 l000-000 )
      ( obj-at p476 l000-000 )
      ( obj-at p69 l000-000 )
      ( obj-at p115 l000-000 )
      ( obj-at p499 l000-000 )
      ( obj-at p265 l000-000 )
      ( obj-at p482 l000-000 )
    )
  )
)
