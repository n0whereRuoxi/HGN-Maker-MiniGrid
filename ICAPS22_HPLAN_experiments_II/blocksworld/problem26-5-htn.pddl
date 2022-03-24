( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b441 - block
    b228 - block
    b380 - block
    b614 - block
    b236 - block
    b204 - block
    b929 - block
    b320 - block
    b188 - block
    b766 - block
    b698 - block
    b131 - block
    b551 - block
    b652 - block
    b426 - block
    b560 - block
    b316 - block
    b633 - block
    b818 - block
    b683 - block
    b933 - block
    b303 - block
    b812 - block
    b30 - block
    b664 - block
    b103 - block
    b327 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b441 )
    ( on b228 b441 )
    ( on b380 b228 )
    ( on b614 b380 )
    ( on b236 b614 )
    ( on b204 b236 )
    ( on b929 b204 )
    ( on b320 b929 )
    ( on b188 b320 )
    ( on b766 b188 )
    ( on b698 b766 )
    ( on b131 b698 )
    ( on b551 b131 )
    ( on b652 b551 )
    ( on b426 b652 )
    ( on b560 b426 )
    ( on b316 b560 )
    ( on b633 b316 )
    ( on b818 b633 )
    ( on b683 b818 )
    ( on b933 b683 )
    ( on b303 b933 )
    ( on b812 b303 )
    ( on b30 b812 )
    ( on b664 b30 )
    ( on b103 b664 )
    ( on b327 b103 )
    ( clear b327 )
  )
  ( :tasks
    ( Make-26Pile b228 b380 b614 b236 b204 b929 b320 b188 b766 b698 b131 b551 b652 b426 b560 b316 b633 b818 b683 b933 b303 b812 b30 b664 b103 b327 )
  )
)
