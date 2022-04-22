( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-951 - location
    l000-455 - location
    l000-731 - location
    l000-634 - location
    l000-620 - location
    l000-125 - location
    l000-186 - location
    p212 - obj
    p43 - obj
    p764 - obj
    p267 - obj
    p309 - obj
    p597 - obj
    p465 - obj
    p751 - obj
    p869 - obj
    p531 - obj
    p641 - obj
    p976 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-951 c000 )
    ( in-city l000-455 c000 )
    ( in-city l000-731 c000 )
    ( in-city l000-634 c000 )
    ( in-city l000-620 c000 )
    ( in-city l000-125 c000 )
    ( in-city l000-186 c000 )
    ( obj-at p212 l000-455 )
    ( obj-at p43 l000-125 )
    ( obj-at p764 l000-186 )
    ( obj-at p267 l000-731 )
    ( obj-at p309 l000-731 )
    ( obj-at p597 l000-455 )
    ( obj-at p465 l000-731 )
    ( obj-at p751 l000-125 )
    ( obj-at p869 l000-634 )
    ( obj-at p531 l000-951 )
    ( obj-at p641 l000-731 )
    ( obj-at p976 l000-186 )
  )
  ( :goal
    ( and
      ( obj-at p212 l000-000 )
      ( obj-at p43 l000-000 )
      ( obj-at p764 l000-000 )
      ( obj-at p267 l000-000 )
      ( obj-at p309 l000-000 )
      ( obj-at p597 l000-000 )
      ( obj-at p465 l000-000 )
      ( obj-at p751 l000-000 )
      ( obj-at p869 l000-000 )
      ( obj-at p531 l000-000 )
      ( obj-at p641 l000-000 )
      ( obj-at p976 l000-000 )
    )
  )
)
