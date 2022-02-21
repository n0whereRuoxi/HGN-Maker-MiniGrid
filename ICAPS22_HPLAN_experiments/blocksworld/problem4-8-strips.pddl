( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b543 - block
    b24 - block
    b244 - block
    b204 - block
    b249 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b543 )
    ( on b24 b543 )
    ( on b244 b24 )
    ( on b204 b244 )
    ( on b249 b204 )
    ( clear b249 )
  )
  ( :goal
    ( and
      ( clear b543 )
      ( clear b543 )
      ( clear b543 )
      ( clear b543 )
      ( clear b543 )
    )
  )
)
