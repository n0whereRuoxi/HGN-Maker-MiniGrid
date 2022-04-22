( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-576 - location
    l000-895 - location
    l000-492 - location
    l000-445 - location
    l000-682 - location
    l000-713 - location
    l000-191 - location
    l000-502 - location
    l000-639 - location
    l000-381 - location
    p465 - obj
    p564 - obj
    p34 - obj
    p957 - obj
    p839 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-576 c000 )
    ( in-city l000-895 c000 )
    ( in-city l000-492 c000 )
    ( in-city l000-445 c000 )
    ( in-city l000-682 c000 )
    ( in-city l000-713 c000 )
    ( in-city l000-191 c000 )
    ( in-city l000-502 c000 )
    ( in-city l000-639 c000 )
    ( in-city l000-381 c000 )
    ( obj-at p465 l000-576 )
    ( obj-at p564 l000-576 )
    ( obj-at p34 l000-682 )
    ( obj-at p957 l000-713 )
    ( obj-at p839 l000-381 )
  )
  ( :goal
    ( and
      ( obj-at p465 l000-000 )
      ( obj-at p564 l000-000 )
      ( obj-at p34 l000-000 )
      ( obj-at p957 l000-000 )
      ( obj-at p839 l000-000 )
    )
  )
)
