( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b138 - block
    b366 - block
    b627 - block
    b176 - block
    b56 - block
    b983 - block
    b711 - block
    b326 - block
    b920 - block
    b575 - block
    b580 - block
    b258 - block
    b779 - block
    b906 - block
    b816 - block
    b177 - block
    b842 - block
    b976 - block
    b122 - block
    b787 - block
    b549 - block
    b71 - block
    b134 - block
    b705 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b138 )
    ( on b366 b138 )
    ( on b627 b366 )
    ( on b176 b627 )
    ( on b56 b176 )
    ( on b983 b56 )
    ( on b711 b983 )
    ( on b326 b711 )
    ( on b920 b326 )
    ( on b575 b920 )
    ( on b580 b575 )
    ( on b258 b580 )
    ( on b779 b258 )
    ( on b906 b779 )
    ( on b816 b906 )
    ( on b177 b816 )
    ( on b842 b177 )
    ( on b976 b842 )
    ( on b122 b976 )
    ( on b787 b122 )
    ( on b549 b787 )
    ( on b71 b549 )
    ( on b134 b71 )
    ( on b705 b134 )
    ( clear b705 )
  )
  ( :goal
    ( and
      ( clear b138 )
    )
  )
)
