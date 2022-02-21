( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b739 - block
    b393 - block
    b173 - block
    b21 - block
    b422 - block
    b546 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b739 )
    ( on b393 b739 )
    ( on b173 b393 )
    ( on b21 b173 )
    ( on b422 b21 )
    ( on b546 b422 )
    ( clear b546 )
  )
  ( :goal
    ( and
      ( clear b739 )
      ( clear b739 )
      ( clear b739 )
      ( clear b739 )
      ( clear b739 )
      ( clear b739 )
    )
  )
)
