( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b946 - block
    b691 - block
    b728 - block
    b248 - block
    b761 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b946 )
    ( on b691 b946 )
    ( on b728 b691 )
    ( on b248 b728 )
    ( on b761 b248 )
    ( clear b761 )
  )
  ( :goal
    ( and
      ( clear b946 )
      ( clear b946 )
      ( clear b946 )
      ( clear b946 )
      ( clear b946 )
    )
  )
)
