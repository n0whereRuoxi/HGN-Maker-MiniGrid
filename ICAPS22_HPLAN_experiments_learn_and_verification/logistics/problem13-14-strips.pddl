( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-326 - location
    l000-289 - location
    l000-694 - location
    l000-344 - location
    l000-823 - location
    l000-155 - location
    l000-363 - location
    l000-599 - location
    l000-889 - location
    l000-705 - location
    l000-322 - location
    l000-628 - location
    l000-714 - location
    l000-256 - location
    l000-438 - location
    p473 - obj
    p202 - obj
    p286 - obj
    p556 - obj
    p252 - obj
    p599 - obj
    p322 - obj
    p886 - obj
    p239 - obj
    p702 - obj
    p800 - obj
    p337 - obj
    p466 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-326 c000 )
    ( in-city l000-289 c000 )
    ( in-city l000-694 c000 )
    ( in-city l000-344 c000 )
    ( in-city l000-823 c000 )
    ( in-city l000-155 c000 )
    ( in-city l000-363 c000 )
    ( in-city l000-599 c000 )
    ( in-city l000-889 c000 )
    ( in-city l000-705 c000 )
    ( in-city l000-322 c000 )
    ( in-city l000-628 c000 )
    ( in-city l000-714 c000 )
    ( in-city l000-256 c000 )
    ( in-city l000-438 c000 )
    ( obj-at p473 l000-438 )
    ( obj-at p202 l000-705 )
    ( obj-at p286 l000-344 )
    ( obj-at p556 l000-628 )
    ( obj-at p252 l000-326 )
    ( obj-at p599 l000-289 )
    ( obj-at p322 l000-322 )
    ( obj-at p886 l000-256 )
    ( obj-at p239 l000-823 )
    ( obj-at p702 l000-344 )
    ( obj-at p800 l000-438 )
    ( obj-at p337 l000-344 )
    ( obj-at p466 l000-289 )
  )
  ( :goal
    ( and
      ( obj-at p473 l000-000 )
      ( obj-at p202 l000-000 )
      ( obj-at p286 l000-000 )
      ( obj-at p556 l000-000 )
      ( obj-at p252 l000-000 )
      ( obj-at p599 l000-000 )
      ( obj-at p322 l000-000 )
      ( obj-at p886 l000-000 )
      ( obj-at p239 l000-000 )
      ( obj-at p702 l000-000 )
      ( obj-at p800 l000-000 )
      ( obj-at p337 l000-000 )
      ( obj-at p466 l000-000 )
    )
  )
)
