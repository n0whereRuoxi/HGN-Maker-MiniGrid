( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-313 - location
    l000-789 - location
    l000-683 - location
    l000-192 - location
    l000-405 - location
    l000-955 - location
    l000-975 - location
    l000-840 - location
    p506 - obj
    p407 - obj
    p897 - obj
    p949 - obj
    p806 - obj
    p203 - obj
    p695 - obj
    p995 - obj
    p136 - obj
    p586 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-313 c000 )
    ( in-city l000-789 c000 )
    ( in-city l000-683 c000 )
    ( in-city l000-192 c000 )
    ( in-city l000-405 c000 )
    ( in-city l000-955 c000 )
    ( in-city l000-975 c000 )
    ( in-city l000-840 c000 )
    ( obj-at p506 l000-955 )
    ( obj-at p407 l000-683 )
    ( obj-at p897 l000-405 )
    ( obj-at p949 l000-405 )
    ( obj-at p806 l000-683 )
    ( obj-at p203 l000-975 )
    ( obj-at p695 l000-789 )
    ( obj-at p995 l000-192 )
    ( obj-at p136 l000-683 )
    ( obj-at p586 l000-840 )
  )
  ( :goal
    ( and
      ( obj-at p506 l000-000 )
      ( obj-at p407 l000-000 )
      ( obj-at p897 l000-000 )
      ( obj-at p949 l000-000 )
      ( obj-at p806 l000-000 )
      ( obj-at p203 l000-000 )
      ( obj-at p695 l000-000 )
      ( obj-at p995 l000-000 )
      ( obj-at p136 l000-000 )
      ( obj-at p586 l000-000 )
    )
  )
)
