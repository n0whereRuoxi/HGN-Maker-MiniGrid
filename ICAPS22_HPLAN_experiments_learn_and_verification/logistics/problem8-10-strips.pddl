( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-728 - location
    l000-465 - location
    l000-147 - location
    l000-842 - location
    l000-922 - location
    p663 - obj
    p197 - obj
    p253 - obj
    p883 - obj
    p824 - obj
    p233 - obj
    p882 - obj
    p449 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-728 c000 )
    ( in-city l000-465 c000 )
    ( in-city l000-147 c000 )
    ( in-city l000-842 c000 )
    ( in-city l000-922 c000 )
    ( obj-at p663 l000-728 )
    ( obj-at p197 l000-842 )
    ( obj-at p253 l000-842 )
    ( obj-at p883 l000-465 )
    ( obj-at p824 l000-465 )
    ( obj-at p233 l000-465 )
    ( obj-at p882 l000-842 )
    ( obj-at p449 l000-147 )
  )
  ( :goal
    ( and
      ( obj-at p663 l000-000 )
      ( obj-at p197 l000-000 )
      ( obj-at p253 l000-000 )
      ( obj-at p883 l000-000 )
      ( obj-at p824 l000-000 )
      ( obj-at p233 l000-000 )
      ( obj-at p882 l000-000 )
      ( obj-at p449 l000-000 )
    )
  )
)
