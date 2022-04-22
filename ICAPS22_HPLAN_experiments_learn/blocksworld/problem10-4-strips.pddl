( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b93 - block
    b302 - block
    b485 - block
    b369 - block
    b588 - block
    b379 - block
    b866 - block
    b355 - block
    b146 - block
    b834 - block
    b587 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b93 )
    ( on b302 b93 )
    ( on b485 b302 )
    ( on b369 b485 )
    ( on b588 b369 )
    ( on b379 b588 )
    ( on b866 b379 )
    ( on b355 b866 )
    ( on b146 b355 )
    ( on b834 b146 )
    ( on b587 b834 )
    ( clear b587 )
  )
  ( :goal
    ( and
      ( clear b93 )
    )
  )
)
