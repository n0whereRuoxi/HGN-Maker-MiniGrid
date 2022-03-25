( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-550 - location
    l000-15 - location
    l000-370 - location
    l000-831 - location
    l000-809 - location
    l000-479 - location
    l000-859 - location
    l000-265 - location
    l000-523 - location
    l000-225 - location
    l000-453 - location
    l000-269 - location
    p653 - obj
    p573 - obj
    p95 - obj
    p212 - obj
    p307 - obj
    p669 - obj
    p811 - obj
    p852 - obj
    p107 - obj
    p75 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-550 c000 )
    ( in-city l000-15 c000 )
    ( in-city l000-370 c000 )
    ( in-city l000-831 c000 )
    ( in-city l000-809 c000 )
    ( in-city l000-479 c000 )
    ( in-city l000-859 c000 )
    ( in-city l000-265 c000 )
    ( in-city l000-523 c000 )
    ( in-city l000-225 c000 )
    ( in-city l000-453 c000 )
    ( in-city l000-269 c000 )
    ( obj-at p653 l000-523 )
    ( obj-at p573 l000-370 )
    ( obj-at p95 l000-523 )
    ( obj-at p212 l000-15 )
    ( obj-at p307 l000-809 )
    ( obj-at p669 l000-269 )
    ( obj-at p811 l000-859 )
    ( obj-at p852 l000-550 )
    ( obj-at p107 l000-831 )
    ( obj-at p75 l000-809 )
  )
  ( :goal
    ( and
      ( obj-at p653 l000-000 )
      ( obj-at p573 l000-000 )
      ( obj-at p95 l000-000 )
      ( obj-at p212 l000-000 )
      ( obj-at p307 l000-000 )
      ( obj-at p669 l000-000 )
      ( obj-at p811 l000-000 )
      ( obj-at p852 l000-000 )
      ( obj-at p107 l000-000 )
      ( obj-at p75 l000-000 )
    )
  )
)
