( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-152 - location
    l000-952 - location
    l000-394 - location
    l000-961 - location
    p864 - obj
    p888 - obj
    p984 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-152 c000 )
    ( in-city l000-952 c000 )
    ( in-city l000-394 c000 )
    ( in-city l000-961 c000 )
    ( obj-at p864 l000-394 )
    ( obj-at p888 l000-152 )
    ( obj-at p984 l000-961 )
  )
  ( :goal
    ( and
      ( obj-at p864 l000-000 )
      ( obj-at p888 l000-000 )
      ( obj-at p984 l000-000 )
    )
  )
)
