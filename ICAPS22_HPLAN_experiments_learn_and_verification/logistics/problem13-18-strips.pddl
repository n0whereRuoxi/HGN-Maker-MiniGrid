( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-469 - location
    l000-322 - location
    l000-802 - location
    l000-952 - location
    l000-342 - location
    l000-616 - location
    l000-801 - location
    l000-366 - location
    l000-104 - location
    l000-604 - location
    l000-222 - location
    l000-303 - location
    l000-245 - location
    l000-229 - location
    l000-75 - location
    l000-887 - location
    l000-69 - location
    l000-728 - location
    l000-606 - location
    p823 - obj
    p595 - obj
    p934 - obj
    p711 - obj
    p787 - obj
    p204 - obj
    p601 - obj
    p928 - obj
    p70 - obj
    p611 - obj
    p360 - obj
    p492 - obj
    p693 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-469 c000 )
    ( in-city l000-322 c000 )
    ( in-city l000-802 c000 )
    ( in-city l000-952 c000 )
    ( in-city l000-342 c000 )
    ( in-city l000-616 c000 )
    ( in-city l000-801 c000 )
    ( in-city l000-366 c000 )
    ( in-city l000-104 c000 )
    ( in-city l000-604 c000 )
    ( in-city l000-222 c000 )
    ( in-city l000-303 c000 )
    ( in-city l000-245 c000 )
    ( in-city l000-229 c000 )
    ( in-city l000-75 c000 )
    ( in-city l000-887 c000 )
    ( in-city l000-69 c000 )
    ( in-city l000-728 c000 )
    ( in-city l000-606 c000 )
    ( obj-at p823 l000-229 )
    ( obj-at p595 l000-469 )
    ( obj-at p934 l000-69 )
    ( obj-at p711 l000-887 )
    ( obj-at p787 l000-342 )
    ( obj-at p204 l000-75 )
    ( obj-at p601 l000-322 )
    ( obj-at p928 l000-366 )
    ( obj-at p70 l000-104 )
    ( obj-at p611 l000-604 )
    ( obj-at p360 l000-229 )
    ( obj-at p492 l000-952 )
    ( obj-at p693 l000-469 )
  )
  ( :goal
    ( and
      ( obj-at p823 l000-000 )
      ( obj-at p595 l000-000 )
      ( obj-at p934 l000-000 )
      ( obj-at p711 l000-000 )
      ( obj-at p787 l000-000 )
      ( obj-at p204 l000-000 )
      ( obj-at p601 l000-000 )
      ( obj-at p928 l000-000 )
      ( obj-at p70 l000-000 )
      ( obj-at p611 l000-000 )
      ( obj-at p360 l000-000 )
      ( obj-at p492 l000-000 )
      ( obj-at p693 l000-000 )
    )
  )
)
