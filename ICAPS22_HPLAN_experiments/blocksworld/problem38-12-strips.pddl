( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b420 - block
    b66 - block
    b278 - block
    b573 - block
    b30 - block
    b750 - block
    b246 - block
    b835 - block
    b818 - block
    b173 - block
    b867 - block
    b925 - block
    b201 - block
    b223 - block
    b691 - block
    b647 - block
    b783 - block
    b920 - block
    b833 - block
    b944 - block
    b445 - block
    b904 - block
    b312 - block
    b302 - block
    b342 - block
    b568 - block
    b417 - block
    b964 - block
    b545 - block
    b630 - block
    b17 - block
    b38 - block
    b349 - block
    b334 - block
    b510 - block
    b754 - block
    b673 - block
    b293 - block
    b36 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b420 )
    ( on b66 b420 )
    ( on b278 b66 )
    ( on b573 b278 )
    ( on b30 b573 )
    ( on b750 b30 )
    ( on b246 b750 )
    ( on b835 b246 )
    ( on b818 b835 )
    ( on b173 b818 )
    ( on b867 b173 )
    ( on b925 b867 )
    ( on b201 b925 )
    ( on b223 b201 )
    ( on b691 b223 )
    ( on b647 b691 )
    ( on b783 b647 )
    ( on b920 b783 )
    ( on b833 b920 )
    ( on b944 b833 )
    ( on b445 b944 )
    ( on b904 b445 )
    ( on b312 b904 )
    ( on b302 b312 )
    ( on b342 b302 )
    ( on b568 b342 )
    ( on b417 b568 )
    ( on b964 b417 )
    ( on b545 b964 )
    ( on b630 b545 )
    ( on b17 b630 )
    ( on b38 b17 )
    ( on b349 b38 )
    ( on b334 b349 )
    ( on b510 b334 )
    ( on b754 b510 )
    ( on b673 b754 )
    ( on b293 b673 )
    ( on b36 b293 )
    ( clear b36 )
  )
  ( :goal
    ( and
      ( clear b420 )
    )
  )
)
