( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-37 - location
    l000-794 - location
    l000-12 - location
    l000-933 - location
    l000-854 - location
    l000-573 - location
    l000-628 - location
    l000-271 - location
    p22 - obj
    p369 - obj
    p957 - obj
    p552 - obj
    p878 - obj
    p828 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-37 c000 )
    ( in-city l000-794 c000 )
    ( in-city l000-12 c000 )
    ( in-city l000-933 c000 )
    ( in-city l000-854 c000 )
    ( in-city l000-573 c000 )
    ( in-city l000-628 c000 )
    ( in-city l000-271 c000 )
    ( obj-at p22 l000-37 )
    ( obj-at p369 l000-271 )
    ( obj-at p957 l000-37 )
    ( obj-at p552 l000-933 )
    ( obj-at p878 l000-933 )
    ( obj-at p828 l000-854 )
  )
  ( :goal
    ( and
      ( obj-at p22 l000-000 )
      ( obj-at p369 l000-000 )
      ( obj-at p957 l000-000 )
      ( obj-at p552 l000-000 )
      ( obj-at p878 l000-000 )
      ( obj-at p828 l000-000 )
    )
  )
)
