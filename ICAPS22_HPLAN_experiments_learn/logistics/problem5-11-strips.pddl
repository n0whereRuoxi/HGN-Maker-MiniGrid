( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-182 - location
    l000-847 - location
    l000-696 - location
    l000-190 - location
    l000-360 - location
    l000-707 - location
    p267 - obj
    p954 - obj
    p435 - obj
    p919 - obj
    p984 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-182 c000 )
    ( in-city l000-847 c000 )
    ( in-city l000-696 c000 )
    ( in-city l000-190 c000 )
    ( in-city l000-360 c000 )
    ( in-city l000-707 c000 )
    ( obj-at p267 l000-847 )
    ( obj-at p954 l000-360 )
    ( obj-at p435 l000-190 )
    ( obj-at p919 l000-360 )
    ( obj-at p984 l000-696 )
  )
  ( :goal
    ( and
      ( obj-at p267 l000-000 )
      ( obj-at p954 l000-000 )
      ( obj-at p435 l000-000 )
      ( obj-at p919 l000-000 )
      ( obj-at p984 l000-000 )
    )
  )
)
