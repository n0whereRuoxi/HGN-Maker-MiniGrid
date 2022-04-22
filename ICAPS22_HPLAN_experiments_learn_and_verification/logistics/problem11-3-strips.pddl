( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-94 - location
    l000-83 - location
    l000-816 - location
    l000-848 - location
    l000-516 - location
    l000-394 - location
    l000-362 - location
    l000-153 - location
    l000-777 - location
    l000-999 - location
    l000-80 - location
    l000-197 - location
    l000-324 - location
    l000-487 - location
    l000-570 - location
    l000-47 - location
    l000-457 - location
    l000-873 - location
    l000-397 - location
    p111 - obj
    p462 - obj
    p304 - obj
    p27 - obj
    p988 - obj
    p900 - obj
    p47 - obj
    p318 - obj
    p330 - obj
    p553 - obj
    p194 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-94 c000 )
    ( in-city l000-83 c000 )
    ( in-city l000-816 c000 )
    ( in-city l000-848 c000 )
    ( in-city l000-516 c000 )
    ( in-city l000-394 c000 )
    ( in-city l000-362 c000 )
    ( in-city l000-153 c000 )
    ( in-city l000-777 c000 )
    ( in-city l000-999 c000 )
    ( in-city l000-80 c000 )
    ( in-city l000-197 c000 )
    ( in-city l000-324 c000 )
    ( in-city l000-487 c000 )
    ( in-city l000-570 c000 )
    ( in-city l000-47 c000 )
    ( in-city l000-457 c000 )
    ( in-city l000-873 c000 )
    ( in-city l000-397 c000 )
    ( obj-at p111 l000-397 )
    ( obj-at p462 l000-570 )
    ( obj-at p304 l000-999 )
    ( obj-at p27 l000-397 )
    ( obj-at p988 l000-47 )
    ( obj-at p900 l000-47 )
    ( obj-at p47 l000-153 )
    ( obj-at p318 l000-457 )
    ( obj-at p330 l000-457 )
    ( obj-at p553 l000-516 )
    ( obj-at p194 l000-47 )
  )
  ( :goal
    ( and
      ( obj-at p111 l000-000 )
      ( obj-at p462 l000-000 )
      ( obj-at p304 l000-000 )
      ( obj-at p27 l000-000 )
      ( obj-at p988 l000-000 )
      ( obj-at p900 l000-000 )
      ( obj-at p47 l000-000 )
      ( obj-at p318 l000-000 )
      ( obj-at p330 l000-000 )
      ( obj-at p553 l000-000 )
      ( obj-at p194 l000-000 )
    )
  )
)
