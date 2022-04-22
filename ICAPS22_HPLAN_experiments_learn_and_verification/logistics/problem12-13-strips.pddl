( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-680 - location
    l000-948 - location
    l000-836 - location
    l000-210 - location
    l000-911 - location
    l000-676 - location
    l000-879 - location
    l000-831 - location
    l000-60 - location
    l000-966 - location
    l000-74 - location
    l000-792 - location
    l000-206 - location
    l000-493 - location
    l000-834 - location
    l000-704 - location
    l000-626 - location
    p896 - obj
    p915 - obj
    p69 - obj
    p102 - obj
    p381 - obj
    p961 - obj
    p746 - obj
    p743 - obj
    p347 - obj
    p406 - obj
    p821 - obj
    p182 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-680 c000 )
    ( in-city l000-948 c000 )
    ( in-city l000-836 c000 )
    ( in-city l000-210 c000 )
    ( in-city l000-911 c000 )
    ( in-city l000-676 c000 )
    ( in-city l000-879 c000 )
    ( in-city l000-831 c000 )
    ( in-city l000-60 c000 )
    ( in-city l000-966 c000 )
    ( in-city l000-74 c000 )
    ( in-city l000-792 c000 )
    ( in-city l000-206 c000 )
    ( in-city l000-493 c000 )
    ( in-city l000-834 c000 )
    ( in-city l000-704 c000 )
    ( in-city l000-626 c000 )
    ( obj-at p896 l000-206 )
    ( obj-at p915 l000-834 )
    ( obj-at p69 l000-831 )
    ( obj-at p102 l000-626 )
    ( obj-at p381 l000-948 )
    ( obj-at p961 l000-210 )
    ( obj-at p746 l000-680 )
    ( obj-at p743 l000-680 )
    ( obj-at p347 l000-493 )
    ( obj-at p406 l000-60 )
    ( obj-at p821 l000-206 )
    ( obj-at p182 l000-206 )
  )
  ( :goal
    ( and
      ( obj-at p896 l000-000 )
      ( obj-at p915 l000-000 )
      ( obj-at p69 l000-000 )
      ( obj-at p102 l000-000 )
      ( obj-at p381 l000-000 )
      ( obj-at p961 l000-000 )
      ( obj-at p746 l000-000 )
      ( obj-at p743 l000-000 )
      ( obj-at p347 l000-000 )
      ( obj-at p406 l000-000 )
      ( obj-at p821 l000-000 )
      ( obj-at p182 l000-000 )
    )
  )
)
