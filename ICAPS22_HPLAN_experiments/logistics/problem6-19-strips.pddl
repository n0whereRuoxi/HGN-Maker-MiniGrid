( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-990 - location
    l000-503 - location
    l000-57 - location
    l000-430 - location
    l000-198 - location
    l000-633 - location
    p242 - obj
    p183 - obj
    p865 - obj
    p457 - obj
    p888 - obj
    p521 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-990 c000 )
    ( in-city l000-503 c000 )
    ( in-city l000-57 c000 )
    ( in-city l000-430 c000 )
    ( in-city l000-198 c000 )
    ( in-city l000-633 c000 )
    ( obj-at p242 l000-990 )
    ( obj-at p183 l000-990 )
    ( obj-at p865 l000-990 )
    ( obj-at p457 l000-633 )
    ( obj-at p888 l000-503 )
    ( obj-at p521 l000-503 )
  )
  ( :goal
    ( and
      ( obj-at p242 l000-000 )
      ( obj-at p183 l000-000 )
      ( obj-at p865 l000-000 )
      ( obj-at p457 l000-000 )
      ( obj-at p888 l000-000 )
      ( obj-at p521 l000-000 )
    )
  )
)
